defmodule Duper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Duper.Worker.start_link(arg)
      # {Duper.Worker, arg}
        Duper.Results,
      { Duper.PathFinder,    "/home/okoth/Downloads" }, # you can put in your own file path.
        Duper.WorkerSupervisor,
      { Duper.Gatherer,      1},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Duper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
