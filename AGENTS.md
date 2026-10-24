# Agent guide

Nomos is a semantic game runtime for AI authors; The Signed World is the thesis
it tests. Its practical goal is coherent worlds authored through bounded intent.
Nothing here grants authority to another project.

<!-- house:rules v1 begin. Copied from FieldmouseWorks/burrow house/rules.md, verbatim. Change it there, not here: burrow's house sync rewrites everything between these markers. -->
## House rules

These hold in every repo. This file's own sections add to them and win where
they say something more specific.

- Fix the whole cause. No workarounds, shims, fallbacks or half-migrations:
  when you replace something, delete the old path in the same change.
- One fact, one home. Each rule or fact lives in one place; link to it instead
  of restating it.
- Before you edit, say what done looks like and how it will be checked. Simple
  work gets a short plan, not a ceremony.
- Report only the checks you actually ran, and what they said. Skipped,
  unavailable or "should pass" is never a pass. Keep local and CI results
  apart.
- A new check comes with proof that it fails on the bug it's for.
- Touching a file over about 1,000 lines? Split it in that change.
- The code is the memory. When something goes wrong, make the code, a type, a
  test or a check stop it happening again; a new rule in AGENTS.md is the last
  resort. Say in the PR which one you did.
- Keep going on work you were asked to do. Don't stop to ask again for what's
  already been asked for.
- Never commit what the repo keeps private: secrets, tokens, personal data, and
  anything listed under this file's "Private" section.
- `Closes #N` only when the issue is fully done; otherwise `Refs #N`.
- Tracked files never name a model. Which model does what is the machine's
  business, and model names go stale in weeks.

### Commits

Subjects are `area: plain sentence`, where the area is the module, directory or
tool the change is about: `autoland: merge only the head that was checked`.
Lowercase after the colon, no trailing period, no `feat:`/`fix:` prefixes. The
body, when there is one, says why.
<!-- house:rules end -->

## Start with the active task

Read [README.md](README.md) and [docs/HANDOFF.md](docs/HANDOFF.md) for current
state, then the issue's acceptance and relevant owner decision. For substantive
work, follow [docs/workflow.md](docs/workflow.md), the standing procedure adopted
by [decision 0028](docs/decisions/0028-evidence-driven-workflow.md). Verify the
working tree and fresh open issue/PR lists; old branches are evidence, not a queue.

Read by task: [KERNEL.md](KERNEL.md) and [docs/workspace.md](docs/workspace.md)
for kernel/dependency boundaries; [RUNTIME.md](RUNTIME.md) and decisions
[0019](docs/decisions/0019-r1-final-disposition.md) /
[0021](docs/decisions/0021-runtime-revision-4.md) for accepted R1 work;
[0022](docs/decisions/0022-mortal-estate-presentation-adoption-evidence.md) for
adopter boundaries; [THESIS.md](THESIS.md) for thesis questions; the latest
applicable decision for any acceptance-contract change. Read subsystem reviews
and historical receipts only when the task needs them.

## Authority and engineering boundaries

- R1 is accepted and closed. R2 is stopped and unadmitted under
  [decision 0027](docs/decisions/0027-stop-r2-authorize-look-kernel-experiment.md).
  No R2 repair, rerun or merge is active. The only authorized next
  capability is [#205](https://github.com/TusanHomichi/nomos/issues/205)'s
  quarantined look-kernel experiment; begin with its
  [reference-scene brief](experiments/look-kernel/README.md). It grants no
  accepted implementation, platform choice, Mortal Estate integration or adoption.
- Acceptance precedes implementation. Never silently reinterpret a contract or
  weaken a criterion because an implementation failed. A contract repair needs
  an owner-authorized decision with prior and replacement wording, reason,
  effect on evidence, owner disposition and a new contract revision.
- Until Gate K passes, `THESIS.md` changes only to record a resolved disagreement,
  repair a contradiction or add an open question. New mechanism belongs in
  executable code with a test. Quarantined experiments satisfy no acceptance
  and need clean implementation before promotion.
- The house rule on splitting files over about 1,000 lines applies to code
  here; guiding documents are exempt. It is a shop rule, separate from Gate K
  acceptance. Fix findings in scope or file them immediately with evidence and
  a clear disposition.
- The six kernel crates admit no third-party dependencies. Outside them, R1 uses
  a committed lockfile, vendored or digest-pinned dependencies, preserved licenses
  and additions recorded in `RUNTIME.md`. The boundary checker fails closed on
  undeclared members and forbidden edges.
- Compiled worlds, input packages, historical receipts, evidence branches and
  `gate-k-*` tags are protected evidence. Write new outputs; never repair inputs
  in place or prune evidence as cleanup. Record measured budgets, not adjectives.
- Repo-specific exception to the house rule on model names: the protected
  evaluation records (receipts of what ran) may name models.
- Cold review is design fuzzing; the human owner decides. Formal cold-author and
  cold-debug gates use [COLD_AGENT_PROTOCOL.md](docs/evaluation/COLD_AGENT_PROTOCOL.md).
  Import no other project's validators, document families or governance without
  a Nomos decision. Decision 0028 adopts procedure only, with no new executor.

## Roles and completion

Work splits into three roles, each at maximum effort: the lead owns
conversation, planning, architecture, graph selection, review and integration;
the implementer handles complex implementation, refactoring and debugging; the
runner handles bounded exploration, routine edits, documentation and test
execution. Which model fills each role is set on the machine, not here.
Delegate when useful, with exact inputs, acceptance, file ownership and concurrency
limits; workers preserve others' changes. The parent verifies artifacts. Record
the actual host and model, report unavailable routing and never silently
substitute. Editing instructions cannot change a running model.

Start from a falsifiable issue and a feature branch, never develop on `main`.
Keep one scoped slice and one canonical issue/PR/handoff graph for dependent work.
Follow the workflow's effort policy and keep one next action. No fixed
repair-count cap applies; explicit task budgets and experiment hard stops still
govern. Graph edits grant no authority and do not change success criteria or
reset effort.

Review the diff, run the applicable proof, and open a draft PR with evidence,
limits and issue coverage. Stricter than the house rules on reporting checks:
nothing is green until a non-author reruns the proof at the exact candidate,
recording commit, command, environment, result and reviewer, and browser
receipts stay apart from local and hosted ones. Relevant changes invalidate
affected checks. **Leave merge and contract disposition to the owner.** This
repo is outside the autoland steward: PRs here wait for the owner's merge.

## Checks

Use the cheapest relevant feedback while developing. `nix develop` gives the
pinned toolchains. The ordinary workspace proof is:

```bash
cargo fmt --all -- --check
cargo clippy --workspace --all-targets --locked -- -D warnings
cargo test --workspace --locked
cargo xtask boundary
```

`nix flake check` runs all four, plus the release-profile tests, the frozen
canonical-hash regression and ruff's error rules on the Python tooling, in the
Nix sandbox ([flake.nix](flake.nix)). CI runs it as the `flake` workflow; the
`verify` workflow keeps the harnesses that need a git checkout.

For documentation, also inspect the diff, run `git diff --check` and check changed
links and authority consistency. [Workflow check selection](docs/workflow.md#checks-and-evidence)
preserves applicable hosted gates; [HANDOFF](docs/HANDOFF.md#verification-order)
gives the accepted artifact/browser commands and setup. Do not launch stopped R2
or historical Gate K formal attempts as routine validation.
