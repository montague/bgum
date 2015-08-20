defmodule Bgum.Builder do
  @build_dir "_build_static"

  def build! do
    clean_build_dir!
    workspace = System.tmp_dir!
    load_lib_files!
    run_config
  end

  defp run_config do
    Code.eval_file "config.exs"
  end

  defp load_lib_files! do
    # load lib files
    File.ls!("lib")
    |> Enum.map(&Path.expand(&1, "lib"))
    |> Enum.each(&Code.require_file/1)
  end

  defp clean_build_dir! do
    File.rm_rf! @build_dir
  end
end
