defmodule Inmana.Supply.Retrieve do
  alias Inmana.{Repo, Supply}

  def get_all, do: Repo.all(Supply)

  def get_by_uuid(uuid) do
    Supply
    |> Repo.get(uuid)
    |> handle_result()

    # alternative
    # case Repo.get(Supply, uuid) do
    #   nil -> {:error, %{status: :not_found, message: "Supply not found!"}
    #   supply -> {:ok, supply}
    # end
  end

  defp handle_result(%Supply{} = result), do: {:ok, result}
  defp handle_result(nil), do: {:error, %{status: :not_found, result: "Supply not found!"}}
end
