defmodule Bgum.Renderer do
  require EEx

  def render(hash_dict) do
    layout = File.read!("layout.eex")
    EEx.eval_string layout, HashDict.to_list(hash_dict)
  end
end
