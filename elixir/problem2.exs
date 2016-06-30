defmodule Euler.ProblemTwo do
  def rec_fibb(n, m, max) when n + m < max and rem(n + m, 2) < 1 do
    rec_fibb(m, n + m, max) + n + m
  end

  def rec_fibb(n, m, max) when n + m < max do
    rec_fibb(m, n + m, max)
  end

  def rec_fibb(n, m, max) do
    0
  end
end

ExUnit.start
defmodule ProblemTwoTest do
  use ExUnit.Case, async: true

  test 'solution for problem two' do
    assert Euler.ProblemTwo.rec_fibb(1, 1, 4_000_000) == 4_613_732
  end
end
