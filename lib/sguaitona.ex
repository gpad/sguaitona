defmodule Sguaitona do

  def add_node(node_to_add) do
    Sguaitona.Watcher.add_node(:watcher, node_to_add)
  end

  def nodes() do
    Sguaitona.Watcher.nodes(:watcher)
  end

end


##
# net_kernel:monitor_nodes(true).
# receive nodeup e nodedown
