defmodule Csv.ImportTest do
  use Csv.RepoCase, async: true
  # alias Csv.FixtureSchemas.Site
  alias Csv.Schemas.BuildingConsent
  alias Csv.{Repo, Import}

  @tag timeout: :infinity
  test "imports records of a csv file" do
    headers = [:Series_reference, :Period, :Data_value, :Suppressed, :Status, :Units, :Magnitude, :Subject, :Group, :Series_title_1, :Series_title_2, :Series_title_3, :Series_title_4, :Series_title_5]
    options = [schema: BuildingConsent, headers: headers, repo: Repo]

    "/home/gitpod/large_csv_files/Building consents by region (Monthly).csv" |> Import.call(options)

    count = BuildingConsent |> Repo.aggregate(:count, :id)
    IO.puts "Total: #{inspect count}"
    assert count > 1
  end
end
