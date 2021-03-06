# prizmway-wrk-scripts

Utility script for the `wrk` HTTP benchmarking tool.

## Install dependencies

### `wrk`

To install `wrk`, clone the repo at https://github.com/wg/wrk, `cd` into it, and run `make`. Then you'll want to symlink the binary so that the `wrk` command is available as a shell command:

```bash
sudo ln -s ~/PATH/TO/wrk/wrk /usr/local/bin
```

In addition to allowing you to use this utility, the symlink allows you to simply call `wrk` from anywhere.

### `jq`

The `jq` command-line JSON processer is necessary for parsing the results of some requests - it can be installed by following the instructions for your OS at https://stedolan.github.io/jq/download/. You'll want to either install `jq` in the directory where your command line binaries are available (typically /usr/local/bin/ on MacOS), or symlink it via the command

```bash
sudo ln -s ~/PATH/TO/jq /usr/local/bin
```

If you are unable to run `jq` on your command line, you may need to adjust the permissions via `chmod +x jq`.

## Use

To use this script, run it via the command `sh ./run.sh` and provide the following flags:

`-s` - the name of the .lua script you want to run (without the file extension, so just like `create_lane`)
`-u` - the url to test
`-k` - the preshared key (not necessary in local dev, required for running against a production instance - more on this below)
`-t` - the number of threads you want `wrk` to use
`-c` - the number of connections you want `wrk` to simulate
`-d` - the duration of the `wrk` test

For example

```bash
sh ./run.sh -s create_lane -t 2 -c 10 -d 5 -u http://localhost:4000 -k 1234
```

### Preshared key

In order to run this script against the live "dev" instance of Prizmway/EngageLane, you'll need to provide the `-k` option - you can find this value in Headway's Prizmway OnePass vault. Note that it is not necessary for local testing.

## Acceptance criteria

Understand performance when 50 concurrent users are active in the system at the same time.
Each user creates lanes, routes, locations
Each user bulk uploads files
Each user submits matches at the same time
Document the results and determine if any changes need to be made to improve the non-functional requirements for performance.

## Notes

Helpful! https://www.hschne.at/2021/03/09/load-testing-graphql-with-wrk.html
