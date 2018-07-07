# Sguaitona
===

[![Build status](https://travis-ci.org/gpad/sguaitona.svg "Build status")](https://travis-ci.org/alco/porcelain)

## Installation

Execute `mix deps.get`.
You can run `mix credo` to execute analisys on code.

## Run

You should run at least 2 node so you need to start:

`iex --sname s1 -S mix` in uno shell and for example `iex --sname s2 -S mix` in another shell where `s1` and `s2` are the names of the nodes.

## TODO

- We need to find a way to add some action when the node disconnectd
- We need a way to save the list of node in clusters
- Add reload package
- We need a way to propagate to cluster also the node not connected

## Some info

http://erlang.org/doc/man/net_kernel.html
http://erlang.org/doc/man/erlang.html#monitor_node-3
http://erlang.org/doc/man/erl_connect.html
http://learnyousomeerlang.com/distributed-otp-applications
http://erlang.org/doc/apps/erts/alt_dist.html
https://github.com/heroku/ehmon

## Architecture

The __Watcher__ process take care of the connection of various node. You can request it to add node, obtain from it the list of node and register to receive events about node from it.

Methods:
- `add_node(node_name)`
- `remove_node(node_name)`
- `register_for_events(pid // self)`

Event raised from `Watcher`:
- `{:node_added, %NodeInfo{}}`
- `{:node_removed, %NodeInfo{}}`
- `{:node_down, %NodeInfo{}}`
- `{:node_up, %NodeInfo{}}`

The __Logger__ write in the `application logger` alla teh events that appen at application level:

- `{:node_added, %NodeInfo{}}`
- `{:node_removed, %NodeInfo{}}`
- `{:node_down, %NodeInfo{}}`
- `{:node_up, %NodeInfo{}}`

The __SMSNotififier__ send SMS to every registered number info about the event that happen to the nodes. In this module we can select whit event we want receive on SMS and on which phone number.

The __MailNotififier__ send Mail to every registered mail address about the event that happen to teh nodes. In this module we can select whit event we want receive on SMS and on which phone number.
