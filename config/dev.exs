use Mix.Config

config :csv, Csv.Repo,
  database: "csv",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
