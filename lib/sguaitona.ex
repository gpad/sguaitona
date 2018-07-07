defmodule Sguaitona do
  @moduledoc """
  Documentation for Sguaitona.
  """

  def add_node(node_to_add) do
    Sguaitona.Watcher.add_node(node_to_add)
  end

  def nodes() do
    Sguaitona.Watcher.nodes()
  end
end

##
# net_kernel:monitor_nodes(true).
# receive nodeup e nodedown
