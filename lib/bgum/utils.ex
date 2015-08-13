# TODO prevent this from becoming a junk drawer
defmodule Bgum.Utils do
  def ls_with_paths(dir) do
    dir |> File.ls! |> Enum.map(&Path.expand(&1, dir))
  end
end
