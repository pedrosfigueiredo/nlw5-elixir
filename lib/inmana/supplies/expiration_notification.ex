defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationMail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    Enum.each(
      data,
      fn {email, supplies} ->
        email
        |> ExpirationMail.create(supplies)
        |> Mailer.deliver_later!()
      end
    )
  end
end
