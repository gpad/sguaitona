# Sguaitona

## Installation

Execute `mix deps.get`.
You can run `mix credo` to execute analisys on code.

## Run

You should run at least 2 node so you need to start:

`iex --sname s1 -S mix` in uno shell and for example `iex --sname s2 -S mix` in another shell where `s1` and `s2` are the names of the nodes.

## TODO

- If you add the local node, it's duplicated in nodes function
- We need to find a way to add some action when the node disconnectd
- We need a way to save the list of ndoe in clusters
- Add reload package

## Some info

http://erlang.org/doc/man/net_kernel.html
http://erlang.org/doc/man/erlang.html#monitor_node-3
http://erlang.org/doc/man/erl_connect.html
http://learnyousomeerlang.com/distributed-otp-applications
http://erlang.org/doc/apps/erts/alt_dist.html
https://github.com/heroku/ehmon
