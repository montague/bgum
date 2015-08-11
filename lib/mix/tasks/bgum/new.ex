defmodule Mix.Tasks.Bgum.New do
  use Mix.Task

  @shortdoc "Generate a new bgum project"

  @moduledoc """
  Generate a new static site scaffold with bgum

  `mix bgum.new [name]`
  """


  def run(args) do
    if args == [] do
      IO.puts "Project directory required"
    else
      hd(args) |> create_scaffold
    end
  end

  defp create_scaffold(path) do
    File.mkdir_p!("#{path}/content")
    File.touch!("#{path}/layout.eex")
    ~w(javascripts stylesheets images)
    |> Enum.each(&File.mkdir_p!("#{path}/assets/#{&1}"))
    IO.puts "created scaffold at #{path}"
  end
end
