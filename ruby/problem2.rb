module Euler
  class ProblemTwo
    def solve n
      # recursive_fibbonaci 1, 1, n
      iterative_fibbonaci n
    end

    # single pass recursive
    def recursive_fibbonaci n, m, max
      fib = n + m
      if fib < max
        next_fib = fibbonaci m, fib, max
        fib.even? ? fib + next_fib : next_fib
      else
        0
      end
    end

    # single pass iterative
    def iterative_fibbonaci max
      n, m, sum = 1, 1, 0

      while m < max
        n, m = m, n + m
        sum = sum + n if n.even?
      end

      sum
    end

  end
end

puts Euler::ProblemTwo.new.solve 4_000_000
