# TODO should file system stuff be in here? probably not.
defmodule Bgum.Renderer do
  @partial_dir Path.join("source","partials")

  def render(string, args) do
    EEx.eval_string string, assigns: args
  end

  def render_partial(partial, args) do
    Path.join(@partial_dir, "#{partial}.eex")
    |> render_file args
  end

  def render_file(file), do: render_file(file, [])
  def render_file(file, args) do
    File.read!(file) |> render(args)
  end

  def render_with_layout(layout, file) do
    render(layout, body: render_file(file))
  end

  #require IEx
  #require Bgum.Parser
  #alias Bgum.Parser
  #require EEx

  #import Record
  #defrecord :page, [:name, :content]

  #@build_dir Path.expand("_bgum_static")


  ## TODO should this be here?
  #def write_pages(pages) do
    #init_build_dir
    #pages |> Enum.each(fn page ->
      #page |> render_to_file
    #end)
  #end

  #defp render_to_file(page, dir \\ @build_dir) do
    #path = dir |> Path.join("#{page(page, :name)}.html")
    #File.open!(path, [:write, :utf8, :exclusive], fn file ->
      #IO.write file, render_to_string(page(page, :content))
    #end)
  #end


  #defp init_build_dir do
    #if File.exists?(@build_dir) do
      #File.rm_rf "#{@build_dir}/*"
    #else
      #File.mkdir @build_dir
    #end
  #end
end
