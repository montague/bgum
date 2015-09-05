defmodule Bgum.Utils do
  def ls_with_paths(dirs) when is_list(dirs) do
    Enum.flat_map(dirs, &ls_with_paths/1)
  end

  def ls_with_paths(dir) do
    dir |> Path.expand |> Path.wildcard
  end
end
