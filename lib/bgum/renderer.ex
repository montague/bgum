defmodule Bgum.Renderer do
  alias Bgum.Bindings

  @partial_dir Path.join("source","partials")

  def render(file, args \\ []) do
    EEx.eval_file file, assigns: args
  end

  def render_partial(partial, args) do
    Path.join(@partial_dir, "#{partial}.eex")
    |> render(args)
  end

  def render_with_layout(layout, file) do
    body =  render(file)
    bindings = [body: body] ++ Bindings.get(file)
    render(layout, bindings)
  end
end
