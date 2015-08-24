defmodule Bgum.ViewHelpers do
  def create_path_helper_for(file) do
    # path/to/file.html
    prefix = file
              |> Path.rootname
              |> Path.split
              |> Enum.join("_")
    require IEx
    IEx.pry
    quote do
      def unquote(prefix <> "_path") do
        unquote(file)
      end
    end
  end
end
