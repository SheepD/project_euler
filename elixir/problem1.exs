defmodule Euler.ProblemOne do
  def solve(n) do
    sum_of_threes_and_fives(n)
  end

  def sum_of_threes_and_fives(n) when n <= 1 do
    if rem(n,3) < 1 || rem(n,5) < 1, do: n, else: 0
  end

  def sum_of_threes_and_fives(n) do
    sum = if rem(n,3) < 1 || rem(n,5) < 1, do: n, else: 0
    sum + sum_of_threes_and_fives(n - 1)
  end
end

IO.puts ProblemOne.solve(999)
