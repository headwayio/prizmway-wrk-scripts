#!/bin/bash

# https://unix.stackexchange.com/questions/321126/dash-arguments-to-shell-scripts
# usage() {
#   cat << EOF >&2
# Usage: $PROGNAME [-v] [-d <dir>] [-f <file>]

# -f <file>: ...
#  -d <dir>: ...
#        -v: ...
# EOF
#   exit 1
# }

script=""
threads=0
connections=0
duration=0

while getopts s:t:c:d: o; do
  case $o in
    (s) script=$OPTARG;;
    (t) threads=$OPTARG;;
    (c) connections=$OPTARG;;
    (d) duration=$OPTARG;;
    # (*) usage
  esac
done
shift "$((OPTIND - 1))"

echo -------- starting stress test --------
echo "script: $script"
echo "auth_token: $auth_token"
echo "threads: $threads"
echo "connections: $connections"
echo "duration: $duration"

auth_token=$(curl http://localhost:4000/stress-test/start)
echo "auth_token: $auth_token"

eval env token=$auth_token wrk -t $threads -c $connections -d "$duration"s --latency http://localhost:4000/graph -s ./lua_scripts/$script.lua

echo -------- cleaning up after stress test --------
curl http://localhost:4000/stress-test/finish?auth_token=$auth_token
