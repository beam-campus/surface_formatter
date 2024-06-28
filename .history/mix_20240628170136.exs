defmodule SurfaceFormatter.MixProject do
  use Mix.Project

  @source_url "https://github.com/beam-campus/surface_formatter"
  @version "0.7.5"

  def project do
    [
      app: :surface_formatter,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),

      # Hex
      description:
        "A code formatter for Surface, the component based library for Phoenix LiveView",
      package: package(),

      # Docs
      name: "SurfaceFormatter",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:surface,  "~> 0.5"},
      {:ex_doc, ">= 0.19.0", only: [:dev, :docs], runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      extras: [
        "README.md",
        "CHANGELOG.md"
      ]
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      links: %{
        Changelog: @source_url <> "/blob/main/CHANGELOG.md",
        GitHub: @source_url
      }
    }
  end

  defp aliases do
    [
      ci: [
        "format --check-formatted",
        "compile --force --warnings-as-errors",
        "cmd MIX_ENV=test mix test"
      ]
    ]
  end
end
