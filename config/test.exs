use Mix.Config

config :csv, Csv.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("CSV_DATABASE_USER") || "postgres",
  password: System.get_env("CSV_DATABASE_PASSWORD") || "postgres",
  database: "csv_test",
  hostname: System.get_env("CSV_DATABASE_HOST") || "localhost",
  port: 5432,
  log: :info,
  loggers: [],
  pool: Ecto.Adapters.SQL.Sandbox
