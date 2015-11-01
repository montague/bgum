defmodule Mix.Tasks.Bgum.Build do
  alias Bgum.Builder
  use Mix.Task

  @shortdoc "Build a bgum project"

  @moduledoc """
  Build a bgum project

  `mix bgum.build`
  """
  def run([]) do
    #Mix.Task.run("app.start", [])
    run_in_dev_mode
  end

  def run([path | _]) do
    #Mix.Task.run("app.start", args)
    run_in_dev_mode(path)
  end

  def run_in_dev_mode(path \\ "omg") do
    IO.puts "=====running in #{Mix.env} mode====="
    Builder.build!(path)
    IO.puts "=====finished running in #{Mix.env} mode====="
  end
end

