---
title: The autoland steward merges settled PRs
status: Owner decision; procedural, no contract revision
number: 0029
date: 2026-10-23
owner: Peter Permenter
amends: docs/decisions/0028-evidence-driven-workflow.md (merge only)
---

# The autoland steward merges settled PRs

## Authority and problem

All of Peter's other repositories merge through the autoland steward on remi
(burrow's `modules/autoland`). An author opens a draft. Codex reviews it, and
the author fixes or answers every finding. Once Codex finds nothing on the
exact head, every review thread is resolved and CI is green, the steward marks
the PR ready and merges it. Nomos was left out because
[decision 0028](0028-evidence-driven-workflow.md) keeps merging as an owner
action.

On 2026-10-23 Peter was asked whether nomos, LoK-web, the-mortal-estate and
consolebook should stay out of autoland, or whether they should be dropped from
its exclusions with their playbooks rewritten so the steward merges. He chose
the latter for all four ("C"). This decision applies that choice to Nomos. It
changes who merges. It changes no contract, criterion or capability.

## Decision

| Action | Boundary |
| --- | --- |
| Merging a PR | The autoland steward, once Codex finds nothing on the exact head, every review thread is resolved and CI is green |
| Merging a PR that touches `docs/decisions/` or `THESIS.md` | Owner only: the steward settles it and leaves the merge to Peter |
| Other writes to `main`, and contract disposition | Owner only, as before |

- **Authors leave PRs as drafts.** They fix or answer every finding and don't
  mark ready or merge. See AGENTS.md "Pull requests".
- **A merge is not acceptance.** CI's `flake` run on the exact head is a
  non-author rerun of the ordinary workspace proof (AGENTS.md "Checks"); `verify`
  only builds and runs the checkout harnesses. A proof CI doesn't run (the
  browser smoke, Gate K lanes, look-kernel scenes) still needs its non-author
  receipt in the PR or issue before it counts as acceptance evidence. A merged
  PR without that receipt has landed code, not accepted it.
- **Owner disposition stays the owner's.** A contract repair still needs an
  owner-authorized decision with the prior and replacement wording. A new
  decision record is how the owner disposes, so a PR that adds or edits one
  waits for his merge. So does a `THESIS.md` change.
- **Stopped work stays stopped.** R2 is stopped under
  [decision 0027](0027-stop-r2-authorize-look-kernel-experiment.md). The steward
  merging authorizes no R2 repair, rerun or merge, and no capability beyond what
  an issue's own authority grants.
- **Evidence branches stay.** The steward's daily cleanup deletes branches that
  are already in `main`. In this repository it keeps the evidence branches
  (`ci/*`, `cold/*`, `docs/issue-*`, `experiment/*`, `feat/*`, `r1/*`,
  `scratch/*`, `spike/*`), and it never touches `gate-k-*` tags.

## Effect

The [workflow](../workflow.md) authority table and AGENTS.md follow this
decision. Decision 0028 stays as written: it records the setup as it was, and
this decision supersedes only its merge row. Historical receipts, branches and
the #211 record are unchanged.
