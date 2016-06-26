defmodule CryptoQuotation.MercadoBitcoin do
  use HTTPotion.Base

  def process_url(url) do
    "https://www.mercadobitcoin.net/api/v2/ticker/" <> url
  end

  def process_response_body(body) do
    body
    |> IO.iodata_to_binary()
    |> Poison.decode()
  end

  def price("BTC") do
    get("")
    |> format()
  end
  def price(_), do: {:error, "Mercado Bitcoin only exchange BTC"}

  def format(%{status_code: 200, body: {:ok, %{"ticker" => %{"last" => price}}}}) do
    {:ok, price}
  end

  def format(%{body: {:error, _body}}), do: {:error, "Mercado Bitcoin result cant parse"}
  def format(_), do: {:error, "Mercado Bitcoin is off"}
end
