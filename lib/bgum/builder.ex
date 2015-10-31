defmodule Bgum.Builder do
  alias Bgum.Utils
  alias Bgum.Renderer
  alias Bgum.Bindings

  @static_src_dir "_build_static"
  @templates_dir "_templates"

  # monster kitchen sink method
  def build!(path) do
    File.cd! path
    reset_build_dirs!
    load_lib_files_and_run_config
    layout = File.read!("source/layouts/application.html.eex")
    # collect list of files and their destinations
    Enum.reduce(files_to_render, %{}, fn file, map ->
      Dict.put(map, file, dest_for_page(file))
    end)
    # write each file to its destination (includes render)
    |> Enum.each(fn {file_to_open, dest} ->
      File.open!(create_dest(dest), [:write, :utf8, :exclusive], fn f ->
        IO.write f, Renderer.render_with_layout(layout, file_to_open)
      end)
    end)
    File.rm_rf! templates_dir
  end

  def testing do
    "testing things!!"
  end

  def templates_dir do
    @templates_dir
  end

  defp create_dest(path) do
    dest = Path.join(@static_src_dir, path)
    unless File.exists?(dest) do
      File.mkdir_p!(Path.dirname(dest))
    end
    dest
  end

  defp dest_for_page(file_path) do
    file_path
    |> String.split(~r(source/pages/|#{templates_dir}/)) # TODO unhack this
    |> Enum.reverse
    |> hd
    |> Path.rootname
  end

  defp files_to_render do
    ["source/pages/**", "#{templates_dir}/**"]
    |> Utils.ls_with_paths
    |> Enum.filter(&(Path.extname(&1) == ".eex"))
  end

  defp load_lib_files_and_run_config do
    Utils.ls_with_paths("lib/**.ex") |> Enum.each(&Code.require_file/1)
    Code.eval_file "config.exs"
  end

  defp reset_build_dirs! do
    File.rm_rf! @static_src_dir
    File.mkdir! @static_src_dir
    File.rm_rf! templates_dir
    File.mkdir! templates_dir
  end
end
