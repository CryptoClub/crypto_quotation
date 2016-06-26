defmodule CryptoQuotation do
  alias CryptoQuotation.CryptoCompare
  alias CryptoQuotation.MercadoBitcoin

  def price(currency, to \\ "BTC", value \\ 1)
  def price(currency, "BTC", value) do
    case CryptoCompare.price(currency) do
      {:ok, price} -> {:ok, price * value}
      error -> error
    end
  end

  def price(currency, "REAL", value) do
    price(currency, "BTC")
    |> case do
         {:ok, val_btc} ->
           case MercadoBitcoin.price("BTC") do
             {:ok, btc_real} -> {:ok, btc_real * val_btc * value}
             error -> error
           end
         error -> error
    end
  end

end
