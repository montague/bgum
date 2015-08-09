defmodule Mix.Tasks.Bgum do
  use Mix.Task

  @shortdoc "Print bgum help information"

  @moduledoc """
  Prints bgum help info

  `mix bgum`
  """

  def run(args) do
    IO.puts "======bgum: #{args}"
  end
end
