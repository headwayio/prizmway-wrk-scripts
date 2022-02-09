#!/usr/bin/env bash

echo -------- starting $1 stress test... --------

eval env token=$2 wrk -t4 -c10 -d10s --latency http://localhost:4000/graph -s ./lua_scripts/$1.lua
