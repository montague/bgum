defmodule Bgum.Renderer do
  @partial_dir Path.join("source","partials")

  def render(string, args) do
    EEx.eval_string string, assigns: args
  end

  def render_partial(partial, args) do
    Path.join(@partial_dir, "#{partial}.eex")
    |> render_file args
  end

  def render_file(file), do: render_file(file, [])
  def render_file(file, args) do
    File.read!(file) |> render(args)
  end

  def render_with_layout(layout, file) do
    render(layout, body: render_file(file))
  end
end
