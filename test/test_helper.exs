ExUnit.start

defmodule BgumTest.Case do
  use ExUnit.CaseTemplate

  using do
    quote do
      import unquote(__MODULE__)
    end
  end

  # from https://github.com/hexpm/hex/blob/eb8de710d766b8cd3a7fca19e5a4d751be3c2e44/test/test_helper.exs
  # begin file path helpers
  def tmp_path do
    Path.expand("../tmp", __DIR__)
  end

  def tmp_path(extension) do
    Path.join(tmp_path, extension)
  end

  #def fixture_path do
    #Path.expand("fixtures", __DIR__)
  #end

  #def fixture_path(extension) do
    #Path.join(fixture_path, extension)
  #end

  defmacro in_tmp(fun) do
    path = Path.join(["#{__CALLER__.module}", "#{elem(__CALLER__.function, 0)}"])
    quote do
      in_tmp(unquote(path), unquote(fun))
    end
  end

  #defmacro in_fixture(which, fun) do
    #path = Path.join(["#{__CALLER__.module}", "#{elem(__CALLER__.function, 0)}"])
    #quote do
      #in_fixture(unquote(which), unquote(path), unquote(fun))
    #end
  #end

  def in_tmp(tmp, function) do
    path = tmp_path(tmp)
    File.rm_rf!(path)
    File.mkdir_p!(path)
    File.cd!(path, function)
  end

  #def in_fixture(which, tmp, function) do
    #tmp = tmp_path(tmp)
    #File.rm_rf!(tmp)
    #File.mkdir_p!(tmp)

    #which = fixture_path(which)
    #File.cp_r!(which, tmp)

    #File.cd!(tmp, function)
  #end
  # end file path helpers
end
