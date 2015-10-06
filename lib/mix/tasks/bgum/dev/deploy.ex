defmodule Mix.Tasks.Bgum.Dev.Deploy do
  use Mix.Task

  @shortdoc "Build the bgum archive and install it locally"

  @moduledoc """
  Build the bgum archive and install it locally for
  development and testing purposes

  `mix bgum.dev.deploy`
  """
  def run([]) do
    Mix.Task.run("archive.build", [])
    Mix.Task.run("archive.install", ["--force"])
  end
end
