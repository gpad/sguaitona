defmodule Sguaitona.Watcher do
  use GenServer

  def start_link(nodes \\ []) do
    GenServer.start_link(__MODULE__, MapSet.new(nodes), [name: :watcher])
  end

  def init(nodes) do
    :net_kernel.monitor_nodes(true)
    {:ok, nodes}
  end

  @doc """
  Add node to the clusters.
  """
  def add_node(pid, node_to_add) do
    GenServer.call(pid, {:add_node, node_to_add})
  end

  @doc """
  Return the list of the nodes of the cluster.
  """
  def nodes(pid) do
    GenServer.call(pid, {:nodes})
  end

  @doc """
  Executed when receive message to add node to cluster.
  """
  def handle_call({:add_node, node_to_add}, from, nodes) do
    # if (Enum.member?(nodes, node_to_add)) do
    #   {:reply, true, nodes}
    # else
      {:reply, Node.connect(node_to_add), MapSet.put(nodes, node_to_add)}
    # end
  end

  @doc """
  Return the list of nodes in the cluster.
  """
  def handle_call({:nodes}, from, nodes) do
    {:reply, [node | MapSet.to_list(nodes)], nodes}
  end

  @doc """
  Executed when one node of the cluster go disconnected.
  """
  def handle_info({:nodedown, node_to_poll}, nodes) do
    Sguaitona.Poller.try_to_connect(node_to_poll, fn -> Sguaitona.Watcher.add_node(:watcher, node_to_poll) end)
    {:noreply, nodes}
  end

  @doc """
  Executed when a new node is connected to cluster.
  """
  def handle_info({:nodeup, new_node}, nodes) do
    {:noreply, MapSet.put(nodes, new_node)}
  end

  @doc """
  Simply log the unknown message.
  """
  def handle_info(msg, state) do
    IO.puts "handle info #{inspect msg} - #{inspect state}"
    {:noreply, state}
  end

end
