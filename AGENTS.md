# Agent guide

Nomos is a semantic game runtime for AI authors; The Signed World is the thesis
it tests. Its practical goal is coherent worlds authored through bounded intent.
Nothing here grants authority to another project.

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
  executable code with a test. Engineer the accepted path; do not add a shim
  merely to pass a check. Quarantined experiments satisfy no acceptance and need
  clean implementation before promotion.
- Touching a code file over about 1,000 lines requires decomposing it in that
  change. This shop rule is separate from Gate K acceptance; guiding documents
  are exempt. Fix findings in scope or file them immediately with evidence and
  a clear disposition.
- The six kernel crates admit no third-party dependencies. Outside them, R1 uses
  a committed lockfile, vendored or digest-pinned dependencies, preserved licenses
  and additions recorded in `RUNTIME.md`. The boundary checker fails closed on
  undeclared members and forbidden edges.
- Compiled worlds, input packages, historical receipts, evidence branches and
  `gate-k-*` tags are protected evidence. Write new outputs; never repair inputs
  in place or prune evidence as cleanup. Record measured budgets, not adjectives.
- Cold review is design fuzzing; the human owner decides. Formal cold-author and
  cold-debug gates use [COLD_AGENT_PROTOCOL.md](docs/evaluation/COLD_AGENT_PROTOCOL.md).
  Import no other project's validators, document families or governance without
  a Nomos decision. Decision 0028 adopts procedure only, with no new executor.

## Roles and completion

Use explicit model and effort selection: `gpt-6-astra` / `max` owns conversation,
planning, architecture, graph selection, review and integration; `gpt-6-sol` /
`max` handles complex implementation/refactoring/debugging; `gpt-6-luna` / `max`
handles bounded exploration, routine edits, documentation and test execution.
Delegate when useful, with exact inputs, acceptance, file ownership and concurrency
limits; workers preserve others' changes. The parent verifies artifacts. Record
actual host/model availability, report unavailable routing and never silently
substitute. Editing instructions cannot change a running model. DeepSeek remains
paused unless the owner explicitly re-enables it.

Start from a falsifiable issue and a feature branch, never develop on `main`.
Keep one scoped slice and one canonical issue/PR/handoff graph for dependent work;
simple tasks need only a short plan. Follow the workflow's effort policy and keep
one next action. No fixed repair-count cap applies; explicit task budgets and
experiment hard stops still govern. Continue ready authorized work without repeated permission, but
graph edits grant no authority and do not change success criteria or reset effort.

Review the diff, run the applicable proof, and open a draft PR with evidence,
limits and issue coverage. Nothing is green until a non-author reruns the proof
at the exact candidate, recording commit, command, environment, result and reviewer.
Keep local, browser and hosted receipts distinct; relevant changes invalidate
affected checks. **Leave merge and contract disposition to the owner.**

## Checks

Use the cheapest relevant feedback while developing. The ordinary workspace proof
is:

```bash
cargo fmt --all -- --check
cargo clippy --workspace --all-targets --locked -- -D warnings
cargo test --workspace --locked
cargo xtask boundary
```

For documentation, also inspect the diff, run `git diff --check` and check changed
links and authority consistency. [Workflow check selection](docs/workflow.md#checks-and-evidence)
preserves applicable hosted gates; [HANDOFF](docs/HANDOFF.md#verification-order)
gives the accepted artifact/browser commands and setup. Do not launch stopped R2
or historical Gate K formal attempts as routine validation.
