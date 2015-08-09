defmodule Mix.Tasks.Bgum.New do
  use Mix.Task

  @shortdoc "Generate a new bgum project"

  @moduledoc """
  Generate a new static site scaffold with bgum

  `mix bgum.new [name]`
  """


  def run(args) do
    IO.puts "======bgum.new: #{args}"
  end
end


