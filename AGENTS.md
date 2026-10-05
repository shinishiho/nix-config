# Notes for coding agent

- Run `statix` and `deadnix` over `comma` (or literal `,`).

### CLI shape

```sh
nix run nixpkgs#statix -- check .    # exactly one TARGET
nix run nixpkgs#deadnix -- .         # accepts several paths
```

`statix` needs the `check` verb (`statix foo.nix` → `unrecognized subcommand`) and
takes a single TARGET (`statix check a.nix b.nix` → `unexpected argument`). Loop per
file, or point it at `.`.

`statix check` exits 1 when it finds anything, so empty stdout is not proof of
clean — read the exit code, and name the scope (`.` vs the diff) when reporting.
