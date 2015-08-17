defmodule Mix.Tasks.Bgum.NewTest do
  use BgumTest.Case, async: true

  test "creates the correct file structure" do
    IO.puts "creates the correct file structure"
    Mix.Tasks.Bgum.New.run(["bgum"])

    assert File.exists?("bgum/content/")
    assert File.exists?("bgum/layout.eex")
    assert File.exists?("bgum/assets/javascripts")
    assert File.exists?("bgum/assets/stylesheets")
    assert File.exists?("bgum/assets/images")
  end

  test "test" do
    IO.puts "test"
    assert 5 > 5
  end
end
