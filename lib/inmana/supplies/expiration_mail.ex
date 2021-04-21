defmodule Inmana.Supplies.ExpirationMail do
  import Bamboo.Email
  alias Inmana.Supply

  def create(email, supplies) do
    new_email()
    |> from("app@inmana.com.br")
    |> to(email)
    |> subject("Supplies about to expire")
    |> text_body(email_text(supplies))

    # new_email(
    #   to: email,
    #   from: "app@inmana.com.br",
    #   subject: "Supplies about to expire",
    #   text_body: email_text(supplies)
    # )
  end

  defp email_text(supplies) do
    initial_text = "-------- Supplies that are about to expire -------- \n"

    Enum.reduce(supplies, initial_text, fn supply, text -> text <> supply_string(supply) end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiration Date: #{expiration_date}, Responsible: #{responsible} \n"
  end
end
