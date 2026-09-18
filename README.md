# roblox-script-playground

A sandbox repo for Roblox scripts, assets, and experiments. Nothing here is a
shipped game — it's a place to prototype mechanics, break things, and find out
where the limits are.

Everything syncs into Roblox Studio through [Rojo](https://rojo.space/), so the
loop is: edit in your editor, save, watch it appear in Studio.

## Quick start

1. **Install Rojo.** Either grab it with [Rokit](https://github.com/rojo-rbx/rokit)
   (`rokit add rojo && rokit install`), or download a release from
   [rojo.space](https://rojo.space/docs/v7/getting-started/installation/).
2. **Install the Rojo Studio plugin** — `rojo plugin install`, or from the
   Roblox plugin marketplace.
3. **Start the server** from the repo root:
   ```sh
   rojo serve
   ```
4. **Connect from Studio.** Open a place (a baseplate is fine), find the Rojo
   plugin in the toolbar, and hit *Connect*. The tree below gets synced in.
5. **Playtest.** The Output window should show two lines from the bootstrap
   scripts, one server and one client — that's the sync confirming itself.

To build a place file instead of live-syncing:

```sh
rojo build -o playground.rbxlx
```

Built place files are gitignored; the scripts in `src/` are the source of truth.

## Layout

```
default.project.json  -- Rojo sync map: repo folders -> Roblox services
src/
  server/     -- ServerScriptService.Server      (*.server.luau -> Script)
  client/     -- StarterPlayerScripts.Client     (*.client.luau -> LocalScript)
  shared/     -- ReplicatedStorage.Shared        (*.luau -> ModuleScript)
experiments/
  <name>/     -- one folder per self-contained experiment + its own notes
assets/       -- models, meshes, textures, audio references
docs/         -- longer write-ups, benchmark results, findings
```

`assets/` and `docs/` get created when there's something to put in them. If you
add a new top-level source folder, map it in `default.project.json` or Rojo
won't sync it.

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

## Conventions

- **Luau** for all scripts, `.luau` extension. Prefer `--!strict` at the top of
  new modules; drop to `--!nonstrict` when an experiment fights the type checker
  more than it helps.
- **File suffixes decide the instance type.** `Foo.server.luau` becomes a
  `Script`, `Foo.client.luau` a `LocalScript`, and a plain `Foo.luau` a
  `ModuleScript`. Getting this wrong is the usual reason something "synced but
  didn't run".
- **Naming.** `PascalCase` for ModuleScripts and class-like tables, `camelCase`
  for locals and functions, `SCREAMING_SNAKE_CASE` for constants.
- **Server/client split.** Never trust the client. Even in a playground, keep
  remote-event handlers validating their inputs — the habit matters more than
  the prototype does.
- **One idea per experiment.** If a folder starts doing two things, split it.
- **Notes in-repo.** Each experiment gets a short `README.md`: what was tried,
  what happened, what to do differently. See `experiments/README.md`.
- **Edit in the repo, not in Studio.** Rojo syncs one way. Changes typed into
  Studio's script editor get overwritten on the next save, so if you prototype
  something in Studio, copy it back out before disconnecting.

## Running an experiment

1. `rojo serve`, connect from Studio, playtest.
2. Use the Output window plus the MicroProfiler (`Ctrl+F6`) for anything
   performance-related.
3. Write down what happened in the experiment's notes before moving on.

## License

MIT — see [LICENSE](LICENSE). Copy, modify, and reuse any of this freely,
including in your own games. Attribution is appreciated but not required.

## Status

Early days. The Rojo pipeline and folder structure are in place; content lands
as experiments get built.
