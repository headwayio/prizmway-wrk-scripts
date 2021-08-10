# wrk_scripts

Scripts for use with the `wrk` HTTP benchmarking tool - https://github.com/wg/wrk

To install `wrk`, clone the repo, `cd` into it, and run `make`.

You can run the command from within the `wrk` directory via the command `./wrk`, or you can symlink it like so:

```bash
sudo ln -s ~/path/to/wrk/wrk /usr/local/bin
```

and then just use `wrk` anywhere. For example...

```bash
wrk -t8 -c1000 -d5s --latency https://pzfightclub.stg.trimble-transportation.com/graph -s ~/Documents/other/wrk_scripts/post.lua
```
