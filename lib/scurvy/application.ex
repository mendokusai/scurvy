defmodule Scurvy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  @target Mix.Project.config()[:target]

  use Application

  def start(_type, _args) do
    Picam.Camera.start_link

    opts = [strategy: :one_for_one, name: Scurvy.Supervisor]
    Supervisor.start_link(children(@target), opts)
  end

  # List all child processes to be supervised
  def children("host") do
    [
      # Starts a worker by calling: Scurvy.Worker.start_link(arg)
      # {Scurvy.Worker, arg},
    ]
  end

  def children(_target) do
    [
      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: Scurvy.Router, options: [port: 4001])
    ]
  end
end
