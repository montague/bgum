defmodule Bgum.Builder do
  alias Bgum.Utils

  @static_src_dir "_build_static"

  def build!(path) do
    File.cd!(path)
    reset_build_dir!
    load_lib_files
    run_config
    pages = get_pages
  end

  defp get_pages do
    Utils.ls_with_paths("source/pages/**")
    |> Enum.filter(&(Path.extname(&1) == ".eex"))
  end

  defp run_config do
    Code.eval_file "config.exs"
  end

  defp load_lib_files do
    # load lib files
    Utils.ls_with_paths("lib/**.ex") |> Enum.each(&Code.require_file/1)
  end

  defp reset_build_dir! do
    File.rm_rf! @static_src_dir
    File.mkdir! @static_src_dir
  end
end
