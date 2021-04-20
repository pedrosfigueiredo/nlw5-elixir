defmodule Inmana.Restaurant do
  @moduledoc """
  Module to represent Restaurant entity.
  Includes schema definition and changeset for validation.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "restaurants" do
    field :name, :string
    field :email, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:email, :name])
    |> validate_required([:email, :name])
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
