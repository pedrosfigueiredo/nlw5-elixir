defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationMail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    data
    |> Task.async_stream(fn {email, supplies} -> send_mail(email, supplies) end)
    |> Stream.run()
  end

  defp send_mail(email, supplies) do
    email
    |> ExpirationMail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
