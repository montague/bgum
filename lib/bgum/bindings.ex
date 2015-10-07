defmodule Bgum.Bindings do
  def start do
    Agent.start_link(fn -> HashDict.new end, name: __MODULE__)
  end

  def set(name, bindings) do
    Agent.update(__MODULE__, &Dict.put(&1, name, bindings))
  end

  def get do
    Agent.get(__MODULE__, &(&1))
  end
end
