defmodule Inmana do
  @moduledoc """
  Inmana keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  # define alias since module Create would be ambiguous
  alias Inmana.Restaurants.Create, as: RestaurantCreation
  alias Inmana.Supply.Create, as: SupplyCreation
  alias Inmana.Supply.Retrieve, as: RetrieveSupply

  defdelegate create_restaurant(params), to: RestaurantCreation, as: :call
  defdelegate create_supply(params), to: SupplyCreation, as: :call
  defdelegate get_supply(params), to: RetrieveSupply, as: :get_by_uuid
end
