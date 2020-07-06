# dhall-aws
Exposes AWS data as Dhall records

## Status
Currently unstable and nowhere near comprehensive.

## Git client hooks

Git client hooks are managed with [`lefthook`](https://github.com/Arkweid/lefthook).

[Install it](https://github.com/Arkweid/lefthook/blob/master/docs/full_guide.md#installation) (or, if you use nix-shell, it is included in the `shell.nix`) then run `lefthook install` to sync the Git client hooks.

If the hooks identify issues with formatting, run `./format.sh`
If the hooks identify issues with freezing, run `./refreeze.sh`
