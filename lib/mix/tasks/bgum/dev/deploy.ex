defmodule Mix.Tasks.Bgum.Dev.Deploy do
  require Mix.Shell.IO
  use Mix.Task

  @shortdoc "Build the bgum archive and install it locally"

  @moduledoc """
  Build the bgum archive and install it locally for
  development and testing purposes

  `mix bgum.dev.deploy`
  """
  def run([]) do
    if Mix.Shell.IO.yes?("Did you manually remove the existing archive?") do
      Mix.Task.run("archive.build", [])
      Mix.Task.run("archive.install", ["--force"])
      IO.puts "New archive built and installed"
    else
      Mix.Shell.IO.info "Please remove the existing archive prior to running this task."
    end
  end
end
