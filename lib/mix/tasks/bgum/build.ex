defmodule Mix.Tasks.Bgum.Build do
  use Mix.Task

  @shortdoc "Build a bgum project"

  @moduledoc """
  Build a bgum project

  `mix bgum.build`
  """

  def run(args) do
    IO.puts "======bgum.build: #{args}"
  end
end

