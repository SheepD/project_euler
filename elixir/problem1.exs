defmodule Euler.ProblemOne do
  def sum_of_threes_and_fives(n) when n < 3 do
    0
  end

  def sum_of_threes_and_fives(n) when rem(n,3) < 1 or rem(n,5) < 1 do
    n + sum_of_threes_and_fives(n - 1)
  end

  def sum_of_threes_and_fives(n) do
    sum_of_threes_and_fives(n - 1)
  end
end

ExUnit.start
defmodule ProblemOneTest do
  use ExUnit.Case, async: true

  test 'solution for problem one' do
    assert Euler.ProblemOne.sum_of_threes_and_fives(999) == 233168
  end
end
