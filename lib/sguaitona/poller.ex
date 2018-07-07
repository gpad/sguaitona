defmodule Sguaitona.Poller do
  @moduledoc """
  Module to try the poller.
  """
  def try_to_connect(node_to_poll, callback) do
    if Node.connect(node_to_poll) do
      IO.puts("Connected to #{node_to_poll}")
      callback.()
    else
      IO.puts("Unable to connect to: #{node_to_poll}, retry in 5 seconds ...")
      :timer.apply_after(5000, __MODULE__, :try_to_connect, [node_to_poll, callback])
    end
  end
end
