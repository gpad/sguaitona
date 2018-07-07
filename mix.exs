defmodule Sguaitona.MixProject do
  use Mix.Project

  def project do
    [
      app: :sguaitona,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [applications: [:logger, :porcelain], mod: {Sguaitona.Application, []}]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 0.9", only: [:dev, :test], runtime: false},
      {:porcelain, "~> 2.0"}
    ]
  end
end
