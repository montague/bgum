defmodule Mix.Tasks.Bgum.New do
  use Mix.Task

  @shortdoc "Generate a new bgum project"

  @moduledoc """
  Generate a new static site scaffold with bgum

  `mix bgum.new [name]`
  """


  def run(args) do
    hd(args) |> create_scaffold
  end

  defp create_scaffold(path) do
    File.mkdir_p!("#{path}/content")
    File.touch!("#{path}/layout.eex")
    ~w(javascripts stylesheets images)
    |> Enum.each(&File.mkdir_p!("#{path}/assets/#{&1}"))
  end
end
