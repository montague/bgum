ExUnit.start

defmodule BgumTest.Case do
  use ExUnit.CaseTemplate

  using do
    quote do
      import unquote(__MODULE__)
    end
  end

  setup_all do
    back_to = File.cwd!
    unless File.exists?("tmp"), do: File.mkdir! "tmp"
    File.cd!("tmp")

    on_exit fn ->
      File.rm_rf "bgum"
      File.cd!(back_to)
    end
  end

end
