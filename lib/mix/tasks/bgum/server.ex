defmodule Mix.Tasks.Bgum.Server do
  use Mix.Task

  @shortdoc "Starts the development server"

  @moduledoc """
  Starts the development server.

  TODO: Auto-build files on change
  """

  def run([path | _]) do
    # TODO don't use ruby :)
    File.cd! path
    System.cmd "ruby", ~w(-run -ehttpd _bgum_build_static/ -p8001)
  end
end
