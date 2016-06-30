require 'benchmark/ips'
require 'minitest/autorun'

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
        next_fib = recursive_fibbonaci m, fib, max
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

    def benchmark
      Benchmark.ips do |x|
        x.report('rec') { recursive_fibbonaci 1, 1, 4_000_000 }
        x.report('itr') { iterative_fibbonaci 4_000_000 }
        x.compare!
      end
    end
  end

  class ProblemTwoTest < Minitest::Test
    def setup
      @sol = ProblemTwo.new
      @ans = 4_613_732
    end

    def test_recursive_fibbonaci
      assert_equal @sol.recursive_fibbonaci(1, 1, 4_000_000), @ans
    end

    def test_iterative_fibbonaci
      assert_equal @sol.iterative_fibbonaci(4_000_000), @ans
    end
  end
end

puts Euler::ProblemTwo.new.benchmark
