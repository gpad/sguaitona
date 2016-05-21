defmodule Sguaitona.WatherTest do
  use ExUnit.Case, async: false
  alias Sguaitona.Watcher

  setup_all do
    # :ok = Application.stop(:sguaitona)
    {:ok, _} = :net_kernel.start([:test, :shortnames])
    :ok
  end

  setup do
    Watcher.clear()
    :ok
  end

  defp start_node(name) do
    {
      Porcelain.spawn("iex", ["--sname", name], [in: :receive, out: :stream]),
      name
    }
  end

  defp stop_node(process) do
    Porcelain.Process.stop(process)
  end

  test "when started contains actual node" do
    assert Watcher.nodes() == [node]
  end

  test "don't duplicate current node" do
    Watcher.add_node(node)
    assert Watcher.nodes() == [node]
  end

  test "return all nodes also if not connected" do
    nodes = [node, :t2@localhost, :t1@localhost]

    nodes |> Enum.each(&Watcher.add_node/1)
    assert Watcher.nodes() == Enum.sort nodes
  end

  test "when node goes down raise event" do
    {process, node_name} = start_node(:another_node)
    Watcher.add_node(node_name)
    IO.inspect Watcher.nodes()
    Watcher.register_for_events()

    stop_node(process)

    assert_receive({:node_added, _})
  end

end
