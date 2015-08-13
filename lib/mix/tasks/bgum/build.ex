defmodule Mix.Tasks.Bgum.Build do
  alias Bgum.Parser
  alias Bgum.Renderer
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
    get_content("#{File.cwd!}/content") |> IO.inspect
    IO.puts "=====running in #{Mix.env} mode====="
  end

  defp get_content(dir) do
    dir |> File.ls! |> Enum.map(fn file ->
      "content/#{file}" |> :yamerl_constr.file
    end)
    |> Enum.map(fn yml ->
      yml |> Parser.mapify_parsed_yml |> Renderer.render
    end)
  end

  defp load_params(yaml) do

  end

  defp apply_layout(content) do
  end
end

