defmodule Mix.Tasks.Bgum.Build do
  use Mix.Task

  @shortdoc "Build a bgum project"

  @moduledoc """
  Build a bgum project

  `mix bgum.build`
  """

  def run(args) do
    case Mix.env do
      :dev -> run_in_dev_mode
    end
  end

  def run_in_dev_mode do
    IO.puts "=====running in dev mode"
    File.cd!("test/fixtures/omg")
    "content" |> File.ls! |> Enum.each(fn file ->
      "content/#{file}" |> File.read! |> IO.chardata_to_string |> IO.puts
    end)
  end
end

