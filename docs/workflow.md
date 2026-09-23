# Evidence-driven workflow

This procedure turns one authorized issue into a reviewable result with evidence
bound to the exact candidate. Decision [0028](decisions/0028-evidence-driven-workflow.md)
adopts the procedure only; it adds no scheduler, validator, or authority. The
active issue and applicable owner decisions remain the source of scope and
acceptance.

Start with [AGENTS.md](../AGENTS.md), [README.md](../README.md),
[the handoff](HANDOFF.md), the issue's acceptance, and the latest applicable
decision. Check the working tree and fresh open issue and pull-request lists
before selecting work. Old branches and historical receipts are evidence, not
a queue. For Nomos, R1 is accepted and closed; decision 0027 stops R2, and
issue [#205](https://github.com/TusanHomichi/nomos/issues/205) is the only
authorized next capability experiment. These facts do not authorize starting
it during another task.

## Bound the outcome before editing

Write a falsifiable outcome and its acceptance checks in the canonical issue.
Use the existing contract and owner decision as written. A failed check is a
finding to fix within scope or file with evidence and a disposition; it is not
permission to reinterpret acceptance. Any contract repair needs an
owner-authorized decision that records the old and replacement wording, reason,
effect on evidence, owner disposition, and new contract revision.

Substantive work uses one canonical task graph in its existing issue, pull
request, or handoff record. Do not copy a live graph into this procedure, a
second issue, a new tracker, or a parallel handoff. Simple one-step work needs
only a short plan. Each substantive node records:

- a stable ID and concrete outcome;
- dependencies;
- assigned owner, requested model, and effort;
- exact inputs and owned files or artifacts;
- falsifiable acceptance;
- state, linked evidence, and remaining effort.

Write common fields once at graph level only when every child inherits them
unambiguously. Record node-specific values and explicit overrides on the node.
Link source claims to their original evidence, and implementation claims to
the exact revision, commands, and results.
The issue for introducing this procedure is [#211](https://github.com/TusanHomichi/nomos/issues/211);
its setup graph stays there and is not duplicated here.

| ID | Outcome | Depends on | Owner / model | Inputs | Acceptance | State / evidence | Effort |
| --- | --- | --- | --- | --- | --- | --- | --- |
| A | Reproduce a candidate artifact | — | Luna / max | issue inputs and clean checkout | declared output hashes match | ready / receipt link | explicit budget, if set |
| B | Independently review that artifact | A | Astra / max | A's exact commit and receipt | reviewer records command, environment, and result | blocked on A / review link | explicit budget, if set |

The table is illustrative, not a live queue. Astra selects ready nodes and owns
planning, architecture, review, and integration. A child unlocks only after
its acceptance is checked against its artifacts; an agent's completion claim
alone does not unlock work. If a batch has a failure, inspect every completed
child result before choosing the next action. Repair a failed result within its
remaining effort. Missing specific evidence is a blocker for that node. Update
the existing graph, archive a completed graph in its issue before advancing,
and keep one next action.

## Roles and dispatch

| Role | Assignment |
| --- | --- |
| `gpt-6-astra` / max | Conversation, task selection, architecture, graph changes, review, and integration |
| `gpt-6-sol` / max | Complex implementation, refactoring, or difficult debugging |
| `gpt-6-luna` / max | Bounded exploration, routine edits, documentation, and test execution |
| DeepSeek | Paused; do not use unless the owner explicitly re-enables it |

Record the requested model and effort, plus the actual host and model when
available. If routing is unavailable or differs, report that fact; never imply
that an instruction changed the model of an already running agent. Dispatch
with exact inputs, outcome, acceptance, file ownership, and isolation
requirements. Workers preserve other changes in the shared tree. The parent
inspects and verifies every returned artifact before integration. Do not claim
a non-author, cold-family, or independent result when the reviewer helped author
the candidate or did not independently perform the stated check.

## Scope and authority

Keep each issue to one authorized slice within Nomos. A new open issue does not
grant capability authority. Under the existing repository flow, an assigned
scoped task permits local edits and checks, issue and evidence updates, a
feature branch push, and a draft PR with evidence. Keep these actions within
that task; unrelated remote changes require separate authorization.

| Action | Boundary |
| --- | --- |
| Scoped local edits and checks; issue/evidence updates; feature push and draft PR | Existing flow for the assigned task |
| Merge, writes to `main`, and contract disposition | Owner only |
| Deployment, manual publication, release, paid services, expanded paid capacity, or new capability | Not authorized by procedural setup |
| Cleanup | Owned temporary outputs, processes, and worktrees after evidence is retained and read back |

Existing automatic CI continues on its checked-in triggers. Preserve compiled
worlds, input packages, historical receipts, evidence branches, and `gate-k-*`
tags. Keep the #211 candidate branch for owner review; delete it only after
merge or explicit owner authorization.

R2 is stopped under [decision 0027](decisions/0027-stop-r2-authorize-look-kernel-experiment.md):
no R2 repair, rerun, final-evidence implementation, candidate refresh, or merge
is authorized. Keep those restrictions exact; do not narrow them to formal
attempts. The current viewer workflow still runs a job named “R2 offline
two-scene proof.” Issue [#212](https://github.com/TusanHomichi/nomos/issues/212)
records this automatic-CI conflict pending owner applicability. Preserve the
existing workflow, report its observed result, and do not manually launch an
R2 run. The `gate-k-evidence` workflow remains an existing regression and
matrix lane; formal Gate K work requires separate owner authority.

The #211 setup ends at a reviewed, verified draft PR with its evidence. The
owner makes the merge decision next. Do not start issue [#205](https://github.com/TusanHomichi/nomos/issues/205)
or repository-transfer issue [#200](https://github.com/TusanHomichi/nomos/issues/200)
as part of this setup.

## Checks and evidence

Choose the cheapest check that answers the next acceptance question. Add a
correctness check only when it captures a missing observation and a meaningful
negative control. Do not create a second acceptance harness or validator to
duplicate an existing check. If a required tool is absent, first use authorized
repository setup or an isolated local tool/dependency setup; do not change the
accepted dependency set to make a check convenient.

For accepted workspace code, the ordinary proof is:

```bash
cargo fmt --all -- --check
cargo clippy --workspace --all-targets --locked -- -D warnings
cargo test --workspace --locked
cargo xtask boundary
```

For documentation, inspect the diff, run `git diff --check`, audit changed
relative links and anchors, and check scope and authority consistency. There is
no dedicated Markdown/link checker or document template in this repository.
Use the changed issue's required checks as well as applicable repository
workflows. The PR workflows `verify`, `gate-k-evidence`, and `nomos viewer`
run on ordinary pull requests; see [verify.yml](../.github/workflows/verify.yml),
[gate-k-evidence.yml](../.github/workflows/gate-k-evidence.yml), and
[nomos-viewer.yml](../.github/workflows/nomos-viewer.yml). The Pages workflow
has no PR job; its push path filter does not select documentation-only changes.
See [executable-gaol-pages.yml](../.github/workflows/executable-gaol-pages.yml).
Do not start historical Gate K formal attempts or stopped R2 checks as routine
validation.

For accepted browser work, follow
[the handoff's verification order](HANDOFF.md#verification-order) for the
complete artifact and browser commands. The accepted smoke command requires
Chrome with `--require-chrome`; a skipped browser run is not a pass. The
checked-in Pages workflow can run for matching pushes to `main` or
`experiment/issue-*-executable-gaol`, or through `workflow_dispatch`; its push
path filter is listed in the workflow file. A PR receipt does not stand for a
main-branch receipt. Deployment authority is separate, and this setup does not
trigger Pages or authorize a manual dispatch. Report any observed automatic
workflow result separately from acceptance or owner disposition.

Before expensive gates, freeze the reviewed commit and tree. After that freeze,
an authorized hosted run and independent local rerun may overlap only when each
has isolated outputs and mutable inputs: use a worktree-local `target/`, and
separate databases, ports, and artifact paths. Never share a writable target
between concurrent worktrees. Record local, browser, hosted, and independent
review receipts separately. A relevant code, test, gate, or input change
invalidates the checks that depend on it; rerun affected checks and never
relabel an old receipt.

Bind each receipt to real artifacts: candidate commit and tree, input and output
hashes, exact commands, environment and tool versions, timing where measured,
exit status, result, and reviewer. Preserve failure output and raw logs. Make no
performance claim without comparable completed measurements. A non-author must
rerun the applicable proof on the exact candidate; Luna executes the rerun and
Astra reviews its raw artifacts. An author's own successful run is useful
development feedback, not independent acceptance evidence.

## Repair and restart

The owner explicitly rejected a fixed repair-count limit on 2026-09-23.
Continue scoped, evidence-driven repairs for authorized work without an
arbitrary retry count. Preserve failed attempts and account for effort across
children and restarts; each repair still follows the accepted scope and
criteria. Do not create a new node to conceal a failed attempt or change
acceptance. An experiment's explicit hard stops and any task-specific effort
budget still control. When an explicit budget is reached, stop and ask the
owner to disposition the remaining work or extend that budget before
proceeding. Request an owner decision only for a real evidence or authority
blocker, or an exhausted explicit budget; finish independent authorized work
first.

## Finish and read back

Preserve immutable raw logs and receipts before cleanup, and record their
digests in the canonical issue or PR. Read back the remote issue and PR to
confirm their state, evidence links, and archived graph. If the owner has
explicitly authorized a merge, verify the exact remote `main` commit and its
applicable workflow results; record those main receipts separately from PR
receipts. After confirmed evidence retention, remove only owned temporary
outputs, processes, and worktrees. Keep the #211 branch for owner review; delete
it only after merge or explicit owner authorization.

On restart, inspect branch and working-tree state, the exact revision, fresh
open issue and PR lists, running processes, and receipt hashes. Reconcile the
canonical graph against those facts, completed artifacts, and owner decisions;
record one next action in that same issue, PR, or handoff. There is no automatic
scheduler, restart, enforcement, or unattended continuation.

Codex instruction loading starts with the host's configured global instructions
(including a configured `CODEX_HOME` override), then the applicable `AGENTS.md`
files from repository root toward the current directory. Resolve each
directory's override or fallback filename, with more-specific later
instructions taking precedence. The default combined `AGENTS.md` limit is
32 KiB. This workflow is read through the repository's `AGENTS.md` link; its
file path alone does not cause automatic discovery. Verify the loaded chain in
a fresh session when the host exposes that information; otherwise report that
limitation separately. Do not edit global Codex configuration as part of a
repository task. See the official [AGENTS.md instructions
guide](https://learn.chatgpt.com/docs/agent-configuration/agents-md) and
[GPT-6 Astra guidance](https://developers.openai.com/blog/rethinking-skills-and-prompts-for-gpt-6-astra).

When the procedure reveals a gap, record the observed problem and evidence in
the existing issue or PR, then propose the smallest reviewable change. A
procedure improvement grants no permission and changes no success criterion.
