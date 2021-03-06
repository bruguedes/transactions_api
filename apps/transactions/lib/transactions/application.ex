defmodule Transactions.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Transactions.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Transactions.PubSub}
      # Start a worker by calling: Transactions.Worker.start_link(arg)
      # {Transactions.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Transactions.Supervisor)
  end
end
