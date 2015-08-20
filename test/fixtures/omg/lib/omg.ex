defmodule Omg do
  def title do
    "title! #{inspect :calendar.universal_time}"
  end

  def body do
    "this is a body at #{inspect title}"
  end
end
