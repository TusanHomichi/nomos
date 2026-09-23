---
title: Adopt the evidence-driven Nomos workflow
status: Owner-requested procedural setup; no contract revision
number: 0028
date: 2026-09-23
owner: Peter Permenter
issue: 211
baseline_commit: 187596df0610bc0a9c27730921ba16ac40e58436
---

# Adopt the evidence-driven Nomos workflow

## Authority and problem

On 2026-09-23 Peter requested: “I’d like to adapt this workflow for this
project,” supplying the evidence-driven bootstrap instructions to establish the
workflow as the standing default, implement and verify the documentation, and
complete setup under this project's existing authorization.

Nomos already requires falsifiable issues, feature branches, draft PRs,
independent reruns and owner disposition. The global agent instructions already
specify Astra/Sol/Luna at maximum reasoning and persistent task graphs. The
repository lacked one linked working procedure and a canonical setup graph;
its unconditional reading list also loaded historical contracts for routine
tasks. This adoption is deliberate under the existing rule against importing
another project's bureaucracy without a Nomos decision.

The request authorizes procedural setup. Merge and contract disposition remain
owner actions; stopped capabilities remain stopped.

## Decision

Use [workflow.md](../workflow.md) as the standing procedure, linked explicitly
from the concise root [AGENTS.md](../../AGENTS.md). Keep current state in
[HANDOFF.md](../HANDOFF.md), with task-specific reading and links to history.
Use the existing issue/PR/handoff system for one canonical graph per active
outcome; add no tracker database, dispatcher, dashboard, plugin or CI system.

Use the setup itself as the worked task in
[#211](https://github.com/TusanHomichi/nomos/issues/211). That issue owns its
mutable graph, exact candidate and receipt links; the PR presents the reviewed
result. Archive the completed graph there rather than copying it into these
instructions. Receipt updates belong in the tracker so they do not continually
change the candidate they describe.

Retain the owner's requested roles: `gpt-6-astra` / `max` for primary judgment,
planning, review and integration; `gpt-6-sol` / `max` for complex implementation;
`gpt-6-luna` / `max` for bounded exploration, routine changes and proof execution.
The generic template's optional DeepSeek helper does not re-enable it here:
DeepSeek stays paused. Record actual host routes in task evidence, not as a
permanent availability promise. An instruction edit cannot change a running
model.

## Effort policy

During setup Peter rejected a proposed two-cycle repair cap: “Don’t think we
need some arbitrary limit.” **No fixed repair-count limit applies to authorized
work.** Continue repairs tied to observed failures and the agreed outcome;
preserve failed attempts and account for effort across children and restarts.
Do not create a new node to conceal a failed attempt or change success criteria.

This owner direction removes the arbitrary count cap. It grants no additional
scope, paid capacity or permission, and does not override an explicit task or
resource budget. Stricter experiment hard stops, including decision 0027 and
issue #205, still require owner disposition and permit no automatic retry.
Record a real evidence/authority blocker or exhausted explicit budget precisely;
complete independent authorized work before asking for the blocking decision.

## Permissions and unchanged boundaries

The setup covers scoped local documentation, issue/evidence records, a feature
branch, applicable checks, an independent rerun and a draft PR under the existing
change flow. It stops with a concrete reviewable result for owner merge. It
does not start the next capability or the repository-identity cleanup.

No contract wording, revision, criterion, budget, dependency, source artifact,
historical receipt or acceptance verdict changes. R1 stays accepted under
[0019](0019-r1-final-disposition.md) and revision 4 under
[0021](0021-runtime-revision-4.md). R2 stays stopped under
[0027](0027-stop-r2-authorize-look-kernel-experiment.md). Gate K remains failed;
round two remains terminated. The Mortal Estate boundary under
[0022](0022-mortal-estate-presentation-adoption-evidence.md) remains intact.
No deployment, paid service, production platform, runtime epoch, accepted
implementation or game adoption is authorized. Merge and contract disposition
remain owner actions.

Current PR workflows are preserved. Inspection found the automatic R2 viewer
job still attached to every PR despite the R2 stop. Its applicability conflict
is filed in [#212](https://github.com/TusanHomichi/nomos/issues/212) for owner
disposition; this procedural record neither resolves that conflict nor waives
the job. No local or manually dispatched R2 proof is part of setup.
Existing identity-link cleanup remains
[#200](https://github.com/TusanHomichi/nomos/issues/200).

## Verification and continuation

Before calling setup verified: review the exact diff and authority consistency;
check changed links and whitespace; run the ordinary workspace proof and account
for applicable hosted workflows; obtain an exact-candidate non-author rerun;
and test effective instructions in a fresh session if the host supports it.
Record any unavailable check honestly. Preserve raw failures, commands, hashes,
environment, timing and exit status in issue/PR evidence and read it back.

The [official instruction-loading guidance](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
supports checking override precedence and fresh-session loading. The
[Astra instruction guidance](https://developers.openai.com/blog/rethinking-skills-and-prompts-for-gpt-6-astra)
supports keeping permanent instructions concise and routing additional reading
by task. These sources inform instruction structure, not Nomos permissions or
model ranking.

Completion and the next action remain on #211. After setup, owner review/merge
is next. Future capability work remains #205's reference-scene-first experiment
under its own frozen acceptance and stop lines. Guidance and agent-led
continuation are implemented here; automatic dispatch, unattended restart and
workflow enforcement are not.
