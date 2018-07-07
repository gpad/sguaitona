defmodule Sguaitona do
  @moduledoc """
  Documentation for Sguaitona.
  """
  alias Sguaitona.Watcher

  def add_node(node_to_add) do
    Watcher.add_node(node_to_add)
  end

  def nodes() do
    Watcher.nodes()
  end
end

##
# net_kernel:monitor_nodes(true).
# receive nodeup e nodedown
