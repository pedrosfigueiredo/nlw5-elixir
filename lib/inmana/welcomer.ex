defmodule Inmana.Welcomer do
  @doc """
  Simple function to greet user.
  Name should be striped of special characters and blank spaces before comparison.
  i.e 'JoHn \n' should be the same as 'john'.
  Only welcomes people if they are over 18 - under age people shall not pass!
  This was used to introduce Pipe Operator and Pattern Matching.
  """
  @doc since: "1.0.0"
  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.downcase()
    |> String.trim()
    |> evaluate(age)
  end

  defp evaluate("douglas adams", 42) do
    {:ok, "Such a pleasure to meet you!"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name} !"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name} !"}
  end
end
