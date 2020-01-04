defmodule Csv.Repo.Migrations.CreateBuildingConsents do
  use Ecto.Migration

  def change do
    create table(:building_consents) do
      add :Period, :string
      add :Data_value, :string
      add :Suppressed, :string
      add :Status, :string
      add :Units, :string
      add :Magnitude, :string
      add :Subject, :string
      add :Group, :string
      add :Series_reference, :string
      add :Series_title_1, :string
      add :Series_title_2, :string
      add :Series_title_3, :string
      add :Series_title_4, :string
      add :Series_title_5, :string
    end
  end
end
