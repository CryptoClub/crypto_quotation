defmodule CryptoQuotation.Mixfile do
  use Mix.Project

  def project do
    [app: :crypto_quotation,
     version: "0.0.1",
     elixir: "~> 1.5",
     package: package(),
     description: "Get quotation of crypto currencies",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [extra_applications: [:logger, :httpotion, :poison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpotion, "~> 3.0"},
      {:poison, "~> 3.1"}
    ]
  end

  defp package do
    [files: ~w(lib mix.exs README.md LICENSE),
     maintainers: ["Esdras Eduardo"],
     licenses: ["GNU"],
     links: %{"GitHub" => "https://github.com/CryptoClub/crypto_quotation"}]
  end

end
