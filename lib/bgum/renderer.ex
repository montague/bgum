# TODO should file system stuff be in here? probably not.
defmodule Bgum.Renderer do
  require IEx
  require Bgum.Parser
  alias Bgum.Parser
  require EEx

  import Record
  defrecord :page, [:name, :content]

  @build_dir Path.expand("_bgum_static")


  # TODO should this be here?
  def write_pages(pages) do
    init_build_dir
    pages |> Enum.each(fn page ->
      page |> render_to_file
    end)
  end

  defp render_to_file(page, dir \\ @build_dir) do
    path = dir |> Path.join("#{page(page, :name)}.html")
    File.open!(path, [:write, :utf8, :exclusive], fn file ->
      IO.write file, render_to_string(page(page, :content))
    end)
  end

  defp render_to_string(hash_dict) do
    layout = File.read!("layout.eex")
    EEx.eval_string layout, HashDict.to_list(hash_dict)
  end

  defp init_build_dir do
    if File.exists?(@build_dir) do
      File.rm_rf "#{@build_dir}/*"
    else
      File.mkdir @build_dir
    end
  end
end
