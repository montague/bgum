defmodule Bgum.Parser do
  import Record
  defrecord :page, [:name, :content]


  def parse_into_page(file) do
    page(name: page_name(file), content: parse_yml(file))
  end

  def parse_yml(file) do
    # takes a list of yamerl-parsed yaml
    # see https://github.com/yakaz/yamerl/blob/ae810a808817d9482b4628ae3e20d746e3729fe0/README.md
    # for examples
    # it's deeply-nested list-of-a-list-of-lists
    file
    |> :yamerl_constr.file
    |> hd
    |> Enum.map(fn {k, v} ->
      { String.to_atom(to_string(k)), to_string(v) }
    end)
    |> Enum.into(HashDict.new)
  end

  defp page_name(file) do
    file |> Path.rootname |> Path.basename
  end
end
