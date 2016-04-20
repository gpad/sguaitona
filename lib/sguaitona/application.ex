defmodule Sguaitona.Application do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      worker(Sguaitona.Watcher, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sguaitona.Supervisor]
    Supervisor.start_link(children, opts)
  end
end


##
# net_kernel:monitor_nodes(true).
# receive nodeup e nodedown
