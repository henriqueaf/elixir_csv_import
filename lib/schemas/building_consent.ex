defmodule Csv.Schemas.BuildingConsent do
  use Ecto.Schema

  schema "building_consents" do
    field :Period, :string
    field :Data_value, :string
    field :Suppressed, :string
    field :Status, :string
    field :Units, :string
    field :Magnitude, :string
    field :Subject, :string
    field :Group, :string
    field :Series_reference, :string
    field :Series_title_1, :string
    field :Series_title_2, :string
    field :Series_title_3, :string
    field :Series_title_4, :string
    field :Series_title_5, :string
  end
end
