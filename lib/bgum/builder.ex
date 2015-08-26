defmodule Bgum.Builder do
  alias Bgum.Utils

  @static_src_dir "_build_static"

  def build!(path) do
    File.cd!(path)
    reset_build_dir!
    load_lib_files_and_run_config
    layout = File.read!("source/layouts/application.html.eex")
    Enum.reduce(files_to_render, %{}, fn file, map ->
      Dict.put(map, file, dest_for_page(file))
    end)
    |> Enum.each(fn {file_to_open, dest} ->
      File.open!(create_dest(dest), [:write, :utf8, :exclusive], fn f ->
        IO.write f, render_file_with_layout(
          file: File.read!(file_to_open), layout: layout
        )
      end)
    end)
  end

  def testing do
    "testing things!!"
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
    |> String.split("source/pages/") # TODO unhack this
    |> Enum.reverse
    |> hd
    |> Path.rootname
  end

  defp render_file_with_layout([file: file, layout: layout]) do
    EEx.eval_string layout, assigns: [body: file]
  end

  defp files_to_render do
    Utils.ls_with_paths("source/pages/**")
    |> Enum.filter(&(Path.extname(&1) == ".eex"))
  end

  defp load_lib_files_and_run_config do
    Utils.ls_with_paths("lib/**.ex") |> Enum.each(&Code.require_file/1)
    Code.eval_file "config.exs"
  end

  defp reset_build_dir! do
    File.rm_rf! @static_src_dir
    File.mkdir! @static_src_dir
  end
end
