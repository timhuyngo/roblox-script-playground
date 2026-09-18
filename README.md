# roblox-script-playground

A sandbox repo for Roblox scripts, assets, and experiments. Nothing here is a
shipped game — it's a place to prototype mechanics, break things, and find out
where the limits are.

## What this repo is for

- **Trying mechanics out.** Movement systems, combat, inventory, camera tricks,
  procedural generation — anything worth a quick prototype before it earns a
  spot in a real project.
- **Testing limits.** Stress tests, part/instance counts, replication behavior,
  rate limits, memory and frame-time experiments.
- **Collecting reusable bits.** Utility modules, math helpers, and patterns that
  turned out well enough to keep around.
- **Stashing assets.** Models, meshes, textures, and sounds tied to a given
  experiment.

Experiments are allowed to be messy, unfinished, or abandoned. That's the point.

## Proposed layout

```
src/
  server/     -- ServerScriptService scripts
  client/     -- StarterPlayerScripts / StarterCharacterScripts
  shared/     -- ReplicatedStorage modules used by both sides
experiments/
  <name>/     -- one folder per self-contained experiment + its own notes
assets/       -- models, meshes, textures, audio references
docs/         -- longer write-ups, benchmark results, findings
```

Folders get created as they're needed rather than all up front.

## Conventions

- **Luau** for all scripts. Prefer `--!strict` at the top of new modules; drop to
  `--!nonstrict` when an experiment fights the type checker more than it helps.
- **Naming.** `PascalCase` for ModuleScripts and class-like tables, `camelCase`
  for locals and functions, `SCREAMING_SNAKE_CASE` for constants.
- **Server/client split.** Never trust the client. Even in a playground, keep
  remote-event handlers validating their inputs — the habit matters more than
  the prototype does.
- **One idea per experiment.** If a folder starts doing two things, split it.
- **Notes in-repo.** Each experiment gets a short `README.md`: what was tried,
  what happened, what to do differently.

## Running an experiment

1. Open Roblox Studio with a baseplate or the relevant place file.
2. Copy the experiment's scripts into the matching services (`ServerScriptService`,
   `StarterPlayerScripts`, `ReplicatedStorage`), or sync them in with
   [Rojo](https://rojo.space/) if the experiment includes a project file.
3. Playtest, and use the Output window plus the MicroProfiler (`Ctrl+F6`) for
   anything performance-related.
4. Write down what happened in the experiment's notes before moving on.

## Status

Early days — the structure above is the plan, and content lands as experiments
get built.
