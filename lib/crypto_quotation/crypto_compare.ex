defmodule CryptoQuotation.CryptoCompare do
  use HTTPotion.Base

  def process_url(url) do
    "https://min-api.cryptocompare.com/data/" <> url
  end

  def process_response_body(body) do
    body
    |> IO.iodata_to_binary()
    |> Poison.decode()
  end

  def price(currency) do
    get("price?fsym=#{currency}&tsyms=BTC")
    |> format()
  end

  def format(%{status_code: 200, body: {:ok, %{"BTC" => price}}}) do
    {:ok, price}
  end

  def format(%{body: {:error, _body}}), do: {:error, "CryptoCompare result cant parse"}
  def format(_), do: {:error, "CryptoCompare is off"}
end
