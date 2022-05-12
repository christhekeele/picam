defmodule Picam.Mixfile do
  use Mix.Project

  def project do
    [
      app: :picam,
      version: "0.4.1",
      elixir: "~> 1.4",
      build_embedded: true,
      start_permanent: Mix.env() == :prod,
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_targets: ["all"],
      make_clean: ["clean"],
      deps: deps(),
      description: description(),
      package: package(),
      name: "Picam",
      homepage_url: "https://github.com/elixir-vision/picam",
      source_url: "https://github.com/elixir-vision/picam"
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:elixir_make, "~> 0.6", runtime: false},
      {:earmark, "~> 1.3", only: :dev},
      {:ex_doc, "~> 0.20", only: :dev}
    ]
  end

  defp description do
    """
    Picam is a library that provides a simple API for streaming MJPEG video and capturing JPEG stills
    using the camera module on Raspberry Pi devices running Linux.
    """
  end

  defp package do
    [
      name: :picam,
      files: [
        "lib",
        "src/*.[ch]",
        "Makefile",
        "test",
        "assets",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      maintainers: ["Frank Hunleth", "Jeff Smith", "Greg Mefford"],
      licenses: ["BSD 3-Clause License"],
      links: %{"GitHub" => "https://github.com/elixir-vision/picam"}
    ]
  end
end
