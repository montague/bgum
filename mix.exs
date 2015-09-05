defmodule Bgum.Mixfile do
  use Mix.Project

  def project do
    [app: :bgum,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :yamerl]]
  end

  defp deps do
    [
      { :yamerl, github: "yakaz/yamerl" },
      { :cowboy, "~> 1.0.2" }
    ]
  end
end
