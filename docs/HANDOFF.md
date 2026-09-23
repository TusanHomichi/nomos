# Nomos handoff

Snapshot: 2026-09-23, reconciled against main
`187596df0610bc0a9c27730921ba16ac40e58436` (PR #210). This is the current-state
entry point; owner decisions and revisioned contracts remain authoritative.

## Current outcome and next action

The standing [workflow](workflow.md), adopted by
[decision 0028](decisions/0028-evidence-driven-workflow.md), uses the existing
issue/PR system. [#211](https://github.com/TusanHomichi/nomos/issues/211) owns the
setup graph, exact candidate, checks, independent rerun and completion record.
Its landing remains an owner action. Read that tracker for the live next action;
there is no second mutable graph here.

The next authorized capability remains
[#205](https://github.com/TusanHomichi/nomos/issues/205): **one real reference
scene at ordinary play size that Peter wants to look at**. Use the
[reference-scene brief](../experiments/look-kernel/README.md). Define its bounded
candidate and checks before implementation, show the rendered reference before
expanding the scene set, then complete the freeze before the two independent
content-only authors. Implementation has not begun. Reference acceptance alone
cannot complete the experiment; rejection stops for owner disposition.

Workflow setup does not start that experiment. Identity/URL cleanup remains
[#200](https://github.com/TusanHomichi/nomos/issues/200). The existing automatic
R2 CI job versus stopped-R2 authority is recorded in
[#212](https://github.com/TusanHomichi/nomos/issues/212); no applicability ruling
or workflow change is inferred here. Refresh open issues and PRs before choosing
work. Historical branches do not supply authorization.

## What works and where it stops

| Line | State and original authority |
| --- | --- |
| Gate K | Round one failed ([0013](decisions/0013-gate-k-disposition.md)); round two terminated incomplete ([0016](decisions/0016-terminate-gate-k-round-two.md)); no new attempt authorized. |
| R1 | Accepted and closed runtime baseline ([0019](decisions/0019-r1-final-disposition.md)); [RUNTIME.md](../RUNTIME.md) revision 4 under [0021](decisions/0021-runtime-revision-4.md). |
| Adopter evidence | Bounded prerequisites completed; no game integration/adoption authority ([0022](decisions/0022-mortal-estate-presentation-adoption-evidence.md), [0023](decisions/0023-observed-scene-presentation-epoch.md)). |
| R2 | Stopped and unadmitted after visual rejection ([0027](decisions/0027-stop-r2-authorize-look-kernel-experiment.md)); landed code and unmerged PR #201 remain evidence. No repair, rerun or merge authorized. |
| Look kernel | One quarantined experiment authorized by 0027; #205 and the reference brief govern its next gates. No platform choice or accepted implementation. |

The accepted surface includes the six dependency-free kernel crates,
read-only effective facts/entity catalog, `nomos-render-plan`, `nomos-play`
(native and wasm), and the offline `apps/nomos-viewer`. It plays six independently
authored areas with authoritative movement, pursuit, receipts and replay.
The quarantined study is a specification/comparison target, not accepted source.

The public viewer remains at the historically configured
<https://conarylabs.github.io/nomos/>; identity cleanup is tracked in #200.
It is runtime evidence, not production art. Audio, networking, replication,
combat, production scaling and an adopting game's Gate 0/Gate 1 remain absent.
The Signed World thesis applies to no game. Nomos grants no cross-project authority.

The latest inspected input-main workflows all succeeded at `187596d`:
[verify 35023408355](https://github.com/TusanHomichi/nomos/actions/runs/35023408355),
[gate-k-evidence 35023408295](https://github.com/TusanHomichi/nomos/actions/runs/35023408295),
and [nomos viewer 35023408283](https://github.com/TusanHomichi/nomos/actions/runs/35023408283).
These are baseline receipts, not proof of a later setup candidate. PR #210's
record explicitly distinguishes its author-side and hosted checks from an
independent rerun.

For the preserved chronology, exact historical receipts and old R2 command list,
see the [pre-setup handoff](https://github.com/TusanHomichi/nomos/blob/187596df0610bc0a9c27730921ba16ac40e58436/docs/HANDOFF.md),
[decision 0027](decisions/0027-stop-r2-authorize-look-kernel-experiment.md) and
[PR #210](https://github.com/TusanHomichi/nomos/pull/210). Historical commands are
not a work queue. Task-specific reading is routed by [AGENTS.md](../AGENTS.md).

## Fresh Linux box

The repository has no package-manager bootstrap script and does not need
`npm install`. Rust dependencies are workspace-local; Three.js is vendored with
its license and digest.

Install these host tools before expecting the complete proof to run:

- Git and Bash;
- rustup (the checked-in `rust-toolchain.toml` selects Rust 1.98.0, `rustfmt`,
  `clippy`, and `wasm32-unknown-unknown`);
- Node 22 or newer, because the smoke client uses Node's global `WebSocket`;
- Google Chrome, Chromium, or a compatible headless-shell binary; and
- common GNU userland used by the proof scripts, including `jq`, `sha256sum`,
  `find`, `sort`, `diff`, `cmp`, `sed`, `grep`, `stat`, and `timeout`.

The viewer CI uses Ubuntu 24.04, Node 22, the pinned Rust toolchain, and
Google Chrome; each workflow and receipt records its own runner.
GitHub CLI is useful for repository state but is not needed to build.

From a new checkout:

```bash
git clone https://github.com/ConaryLabs/nomos.git
cd nomos
git fetch --tags origin
rustup show
rustc --version
cargo --version
node --version
```

`rustup show` provisions the pinned components and wasm target on a connected
machine. After toolchain provisioning, the workspace and accepted artifact can
be proved offline; the recorded network-isolated receipt is
`docs/evaluation/r1-adoption-evidence.md`.

Find a browser, or set it explicitly:

```bash
command -v google-chrome || command -v chromium || command -v chromium-browser
export CHROME_BIN=/absolute/path/to/chrome-or-chrome-headless-shell
"$CHROME_BIN" --version
```

Do not copy a machine-specific Chrome path into the repository. On a minimal
Linux install a headless-shell binary can work when a full Chromium build lacks
desktop libraries.

## Verification order

Run commands from the repository root. The fast accepted-workspace proof is:

```bash
cargo fmt --all -- --check
cargo clippy --workspace --all-targets --locked -- -D warnings
cargo test --workspace --locked
cargo xtask boundary
```

The six-area study and promoted viewer proof must generate artifacts before the
browser consumes them:

```bash
experiments/executable-gaol/gaol verify
crates/nomos-play/build-wasm.sh
cargo build --locked -p nomos-play
node apps/nomos-viewer/build.mjs \
  --from target/executable-gaol \
  --wasm target/wasm32-unknown-unknown/wasm/nomos_play.wasm \
  --out apps/nomos-viewer/dist \
  --receipt target/nomos-viewer-build/receipt.json
node --test apps/nomos-viewer/test/*.test.mjs
node apps/nomos-viewer/smoke/smoke.mjs \
  --dist apps/nomos-viewer/dist \
  --out target/nomos-viewer-smoke \
  --require-chrome
```

The smoke lane must end with six areas, 65 moves, traversal cost 95, zero
external requests, and native replay agreement. Its receipt records bounded
CDP, Chrome-process-group, and HTTP-server shutdown. PR #181 independently ran
the full browser proof ten consecutive times; every process closed within 9 ms
of the reviewer observing PASS, against a 2-second acceptance limit.

Decision 0027 stops the R2 acceptance line. Do not launch its historical proof,
repair, retry or disposition commands. The formal archived Gate K cold-agent
attempts are also stopped under decision 0016; existing CI regression harnesses
do not authorize another attempt. See the workflow for the automatic CI conflict.

## Operational gotchas

- Give every worktree its own fresh `target/`. Some evaluation and viewer
  commands intentionally refer to the literal worktree-local `target/` path;
  sharing a Cargo target across concurrent worktrees can mix candidates.
- If an external `CARGO_TARGET_DIR` is necessary, also audit commands that use
  `target/debug/nomos`, `target/release/nomos-play`, viewer wasm paths, or smoke
  defaults. Prefer the worktree-local default for the complete proof.
- Pages has filtered pushes for `main` and `experiment/issue-*-executable-gaol`,
  plus manual dispatch. A green PR is not a deployment receipt; after an
  authorized merge, verify the exact main runs and any applicable Pages run.
- The smoke lane skips without Chrome unless `--require-chrome` is present.
  Acceptance and CI use `--require-chrome`.
- `apps/nomos-viewer/dist`, `target/executable-gaol`, the wasm module, and the
  native `nomos-play` binary must describe the same checkout. Rebuild them in
  the order above after switching commits.
- Compiled worlds and evidence are immutable inputs. Tests and runtime commands
  write new output; they do not repair a package in place.
- `docs/evaluation/runs/` and the `gate-k-*` tags are historical evidence.
  Never prune them as reinstall cleanup.
- Byte-sensitive evaluation scripts pin `LC_ALL=C`. Preserve that pin when
  adding ordering or tree-digest logic.

## Reconcile before continuing

```bash
git status --short --branch
git fetch origin
git log -5 --oneline --decorate
gh issue list --state open
gh pr list --state open
gh run list --branch main --limit 8
```

Inspect owned running processes, exact revisions and fresh receipts after an
interruption, then reconcile the canonical graph before restarting work. Retain
one next action and preserve other people's changes. An open issue alone does
not authorize starting it, merging, deploying or changing a contract.

Ordinary R1 bug maintenance may begin from a falsifiable issue. New capability
families, later runtime epochs, Gate K attempts, platform choices and game
adoption require their own owner decisions. Follow [workflow.md](workflow.md)
for permissions, effort policy, evidence invalidation and cleanup.
