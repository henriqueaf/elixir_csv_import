use Mix.Config

config :csv, Csv.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "csv_prod",
  hostname: "db",
  port: 5432,
  log: :info,
  loggers: [],
  pool: Ecto.Adapters.SQL.Sandbox
