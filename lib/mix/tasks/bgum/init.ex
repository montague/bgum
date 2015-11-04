defmodule Mix.Tasks.Bgum.Init do
  use Mix.Task

  @shortdoc "Initialize a generated mix project as a bgum static site"

  @moduledoc """
  Initialize a generated mix project as a bgum static site project

  `mix bgum.init`
  """


  def run(_ \\ []) do
    # TODO add templates for these files
    files = ~w(bgum/config.exs bgum/source/layout/layout.eex)
    paths = ~w(
      bgum/source/layout/
      bgum/source/pages/
      bgum/source/partials/
      bgum/source/assets/
    )
    Enum.each(paths, &File.mkdir_p!/1)
    Enum.each(files, &File.touch!/1)
    IO.puts "Project successfully initialized"
  end
end
