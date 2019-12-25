defmodule Csv do
  @moduledoc """
  The Application main module, used to start the main
  Supervisor module Csv.Supervisor.
  """

  use Application

  @doc """
  Executed when application starts. It starts the main Supervisor module.
  ## Examples
    iex> Application.start(:csv)
    {:error, {:already_started, :csv}}
  """

  def start(_type, _args) do
    Csv.Supervisor.start_link
  end
end
