# Look kernel: reference scene first

**Next visible deliverable: one real, reproducible reference scene that Peter
wants to look at at ordinary play size.**

This is a planning brief for [#205](https://github.com/TusanHomichi/nomos/issues/205),
not its freeze record or a new acceptance contract. No kit, compiler, renderer,
or reference frame is implemented or accepted by this document.
[Decision 0027](../../docs/decisions/0027-stop-r2-authorize-look-kernel-experiment.md)
and #205 retain every boundary, proof requirement, measurement, and stop line.

## Start from the existing taste evidence

The [gaol target](../gate-0-gaol-target-pack/TARGET.md) records Peter's
`visual thesis compelling` verdict. Use its
[ordinary-play frame](../gate-0-gaol-target-pack/gameplay-camera.png) as the
primary visual reference, with the
[material/palette study](../gate-0-gaol-target-pack/materials-palette.png),
[actor study](../gate-0-gaol-target-pack/actor-silhouettes.png), and
[provenance manifest](../gate-0-gaol-target-pack/manifest.json).

These generated images describe a desired look. They are not executable camera
settings, shipping assets, textures to project onto geometry, or evidence that
a renderer can produce the scene. Preserve the historical pack unchanged.

## Proposed first slice

A compact gaol environment with an iron-barred gate in a broad stone arch,
shallow dark water crossed by a legible dry route, a brazier with a bounded
amber light pool, and two static representative actor assemblies. The narrow
teal and broader rust silhouettes should remain distinct against stone and
water. Emphasize broad beveled masonry, restrained material detail, stable
scale, and readable whole-scene composition.

This subset is a proposal drawn from the target, not approved artwork or a
binding freeze. It omits HUD, spell, motion, combat, and other gameplay behavior;
it makes no claim to reproduce the complete target pack. The target's oblique
camera and 1672-by-941 frame are taste references. Exact executable camera,
viewport, assets, palette, input grammar, and experiment-only technique must
be recorded prospectively in the experiment definition. No production platform
or game integration is selected here.

## Work in this order

1. **Define the bounded candidate before implementing it.** Meet decision
   0027's prospective-definition requirement: exact reference subset, inputs,
   outputs, commands, authoring boundary, visual rubric, budgets, and checks.
   Identify unresolved choices honestly. Build only the representative kit,
   finite content grammar, compiler, and renderer needed for this slice, under
   `experiments/look-kernel/`, with fresh generated output under `target/`.
   Keep provenance and applicable tests alongside the work from the start.
2. **Show the reference render before expanding the scene set.** Submit an
   unretouched renderer-produced frame at its recorded play size, the exact
   source/kit/compiler/renderer identities, a reproduction command and its
   observed result, and a short account of missing or weak elements. Use
   representative renderable assets; placeholder blocks or an image-generation
   result cannot pass. Ask Peter for the required reference-frame verdict.
   Rejection stops for owner disposition; it does not authorize quiet retuning
   or another attempt.
3. **Freeze, then test independent content authoring.** An accepted reference
   only clears that frame's visual check. Complete #205's entire kit, packet,
   input/output, environment, rubric, and proof freeze before either formal cold
   author begins. Then require both materially different scenes, content-only
   edits, deterministic artifacts, all three frame verdicts, the family verdict,
   and non-author reproduction/audit. Never tune the frozen machinery to rescue
   a cold-authored scene. Reference approval cannot close #205 on its own.

Do not build a general editor, runtime extension, integration layer, or a new
proof framework as a prerequisite to this slice. Required checks still apply;
only machinery necessary for the declared experiment belongs in its scope.

## Make the review useful

Put the actual frame first. Report the following separately so that a failed
candidate has a useful diagnosis:

| Review surface | What to show |
| --- | --- |
| Visual quality | Native-size frame; scene coherence, landmark and actor readability, material hierarchy, and Peter's verdict against the prospectively frozen rubric. |
| Authoring effort | Time to first valid compile and visible frame, validation cycles, files changed, author interactions, and the other measurements required by #205. Unjustified ceilings remain observations. |
| Technical and boundary evidence | Exact source and tool identities, asset provenance, reproduction results, deterministic artifacts, prohibited-input checks, and independent review status. |

These are separate reporting rows, not alternative routes to acceptance. Every
mandatory criterion in #205 must pass. A technical success cannot compensate
for a rejected frame, and an attractive frame cannot compensate for a boundary
violation. Do not invent a verdict or mark pending evidence as passed.

## Keep the result bounded

R1 remains accepted and unchanged; R2 remains stopped. Import no R1/R2 code,
schemas, fixtures, plans, or generated artifacts as dependencies. Take no input
from The Mortal Estate and make no adoption claim. Preserve all historical
failures and receipts. Success supplies evidence for a later owner decision;
it does not itself authorize clean promotion or another runtime epoch.
