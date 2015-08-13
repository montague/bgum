defmodule Mix.Tasks.Bgum.Build do
  alias Bgum.Parser
  alias Bgum.Renderer
  alias Bgum.Utils
  use Mix.Task

  @shortdoc "Build a bgum project"

  @moduledoc """
  Build a bgum project

  `mix bgum.build`
  """

  def run(args) do
    Mix.Task.run("app.start", args)
    run_in_dev_mode
  end

  def run_in_dev_mode do
    IO.puts "=====running in #{Mix.env} mode====="
    File.cd!("test/fixtures/omg")
    content = get_content("#{File.cwd!}/content")
    content |> IO.inspect
    content |> Renderer.write_pages
    IO.puts "=====running in #{Mix.env} mode====="
  end

  defp get_content(dir) do
    dir
    |> Utils.ls_with_paths
    |> Enum.map(&Parser.parse_into_page(&1))
  end
end

