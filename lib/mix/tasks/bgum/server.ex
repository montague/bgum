defmodule Mix.Tasks.Bgum.Server do
  use Mix.Task

  @shortdoc "Starts the development server"

  @moduledoc """
  Starts the development server.

  TODO: Auto-build files on change
  """

  def run(args) do
    # TODO don't use ruby :)
    # TODO figure out path stuff
    System.cmd "ruby", ~w(-run -ehttpd _build_static/ -p8001)
  end
end
