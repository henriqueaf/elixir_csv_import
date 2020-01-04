ExUnit.start()

Code.require_file "test/support.exs"

Ecto.Adapters.SQL.Sandbox.mode(Csv.Repo, :manual)
