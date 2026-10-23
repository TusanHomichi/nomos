{
  description = "Nomos";

  inputs.burrow.url = "git+https://github.com/FieldmouseWorks/burrow";

  # `nix develop` for the toolchains, `nix flake check` for the gate (see
  # burrow's lib/project.nix). The gate is the hermetic part of the workspace
  # proof in AGENTS.md; .github/workflows/verify.yml keeps the steps that need
  # a git checkout, and the evidence and browser lanes keep their own workflows.
  outputs = { self, burrow }: burrow.lib.project {
    inherit self;
    rust = { };
    python = { };
    node = { };
    packages = pkgs: [ pkgs.jq ];
    checks = pkgs:
      let
        # The toolchain rust-toolchain.toml pins, the one the workspace proof
        # names. The workspace has no third-party crates, so Cargo runs offline.
        toolchain = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
        cargoCheck = name: script: pkgs.runCommand name { nativeBuildInputs = [ toolchain ]; } ''
          cp -r ${self} src
          chmod -R u+w src
          cd src
          export HOME=$TMPDIR CARGO_HOME=$TMPDIR/cargo CARGO_NET_OFFLINE=true
          set -euo pipefail
          ${script}
          touch $out
        '';
      in
      {
        # burrow's rust-test runs the release profile; `cargo test` in the
        # workspace proof is the dev profile, with debug assertions and
        # overflow checks.
        rust-test-dev = cargoCheck "rust-test-dev" ''
          cargo test --workspace --locked
        '';

        # KERNEL.md section 10, acceptance 15.
        boundary = cargoCheck "boundary" ''
          cargo xtask boundary
        '';

        # The canonical-hash test prints `HASH <name> <hex>` lines. Four runs,
        # debug twice and release twice, must produce byte-identical lines.
        canonical-hash-regression = cargoCheck "canonical-hash-regression" ''
          export LC_ALL=C
          hashes() {
            cargo test --locked -p nomos-core --test determinism "$@" \
              -- --nocapture --test-threads=1 | grep '^HASH ' | sort
          }
          hashes > debug-1.txt
          hashes > debug-2.txt
          hashes --release > release-1.txt
          hashes --release > release-2.txt
          # Exact count, not just non-empty: a silently dropped line would
          # otherwise let a shrinking proof pass.
          test "$(wc -l < debug-1.txt)" -eq 3 || {
            echo "expected 3 HASH lines, got $(wc -l < debug-1.txt)"; exit 1;
          }
          diff -u debug-1.txt debug-2.txt
          diff -u debug-1.txt release-1.txt
          diff -u release-1.txt release-2.txt
          cat debug-1.txt
        '';
      };
  };
}
