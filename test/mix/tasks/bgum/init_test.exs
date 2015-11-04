defmodule Mix.Tasks.Bgum.InitTest do
  use BgumTest.Case, async: true

  test "creates the correct file structure" do
    in_tmp fn ->
      IO.puts "creates the correct file structure"
      Mix.Tasks.Bgum.Init.run

      assert File.exists?("bgum/config.exs")
      assert File.exists?("bgum/source/layout/layout.eex")
      assert File.exists?("bgum/source/pages/")
      assert File.exists?("bgum/source/partials/")
      assert File.exists?("bgum/source/assets/")
    end
  end
end
