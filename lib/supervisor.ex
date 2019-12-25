defmodule Csv.Supervisor do
  use Supervisor
  alias Csv.{Repo}
  
  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end
  
  # It starts automatically Csv.Repo GenServer.
  # So you can call the Csv.Repo methods without call start_link before:

  # iex> Csv.Repo.start_link
  # iex> Csv.Repo.all
  # {}

  def init(_) do
    children = [
      worker(Repo, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end