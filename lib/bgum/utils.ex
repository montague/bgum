defmodule Bgum.Utils do
  def ls_with_paths(dir) do
    dir |> Path.expand |> Path.wildcard
  end
end
