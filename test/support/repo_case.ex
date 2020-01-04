defmodule Csv.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Csv.Repo

      import Ecto
      import Ecto.Query
      import Csv.RepoCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Csv.Repo)

    if tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Csv.Repo, {:shared, self()})
    end

    :ok
  end
end
