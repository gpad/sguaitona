defmodule Sguaitona.WatherTest do
  use ExUnit.Case, async: false
  alias Sguaitona.Watcher

  setup_all do
    {:ok, _} = :net_kernel.start([:test, :shortnames])
    :ok
  end

  setup do
    Watcher.clear
    :ok
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

end
