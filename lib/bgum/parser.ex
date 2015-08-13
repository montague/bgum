defmodule Bgum.Parser do
  def mapify_parsed_yml(yml) do
    # list of yamerl-parsed yaml
    yml
    |> hd
    |> Enum.map(fn {k, v} -> {String.to_atom(to_string(k)), to_string(v)} end)
    |> Enum.into(HashDict.new)
  end
end
