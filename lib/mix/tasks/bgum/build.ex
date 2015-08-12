defmodule Mix.Tasks.Bgum.Build do
  require EEx
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
    IO.puts "=====running in #{Mix.env} mode"
    File.cd!("test/fixtures/omg")
    get_content("#{File.cwd!}/content") |> IO.inspect
  end

  defp get_content(dir) do
    dir |> File.ls! |> Enum.map(fn file ->
      "content/#{file}" |> :yamerl_constr.file
    end)
  end

  defp apply_layout(content) do

  end
end

