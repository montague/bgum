defmodule Bgum.Builder do
  alias Bgum.Utils

  @static_src_dir "_build_static"

  def build!(path) do
    File.cd!(path)
    reset_build_dir!
    load_lib_files_and_run_config
    layout = File.read!("source/layouts/application.html.eex")
    get_pages_to_render
    |> Enum.each(fn file_to_open ->
      dest = Path.join(@static_src_dir, dest_for_page(file_to_open))
      unless File.exists?(dest) do
        File.mkdir_p!(Path.dirname(dest))
      end
      File.open!(dest, [:write, :utf8, :exclusive], fn f ->
        IO.write f, render_file_with_layout(
          layout, File.read!(file_to_open)
        )
      end)
    end)
  end

  defp dest_for_page(file_path) do
    file_path
    |> String.split("source/pages/") # TODO unhack this
    |> Enum.reverse
    |> hd
    |> Path.rootname
  end

  defp render_file_with_layout(file, layout) do
    EEx.eval_string layout, assigns: [body: file]
  end

  defp get_pages_to_render do
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
