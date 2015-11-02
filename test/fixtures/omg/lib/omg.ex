defmodule Omg do
  def title do
    "title! #{inspect :calendar.universal_time}"
  end

  def body do
    "this is a body at #{inspect title}"
  end

  # TODO write a helper for this
  def build_pages(template_dir) do
    dest = "#{template_dir}/terms"
    File.mkdir_p! dest
    Enum.each(pages, fn page ->
      page_dest = page |> Path.rootname |> Path.basename
      File.open!("#{dest}/#{page_dest}.eex",
        [:write, :utf8, :exclusive],
        &(IO.write &1, File.read!(page)))
    end)
  end

  defp pages do
    "terms/**" |> Path.expand |> Path.wildcard
  end
end
