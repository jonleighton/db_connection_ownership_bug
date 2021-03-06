use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :test, Test.Repo,
  username: "postgres",
  password: "postgres",
  database: "test_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  port: 15432,
  pool: Ecto.Adapters.SQL.Sandbox,
  queue_interval: 2000

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :test, TestWeb.Endpoint,
  http: [port: 4002],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :wallaby, otp_app: :test

config :test, sql_sandbox: true
