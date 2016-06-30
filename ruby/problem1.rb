require 'benchmark/ips'
require 'minitest/autorun'

module Euler
  class ProblemOne
    # two pass iterative
    def solve n
      (1..n).select { |n| n % 3 < 1 || n % 5 < 1 }.inject(:+)
    end

    # single pass recursive
    def rec_solve n
      return 0 if n < 3
      sum = n % 3 < 1 || n % 5 < 1 ? n : 0
      sum + rec_solve(n - 1)
    end

    # single pass iterative
    def itr_solve n
      sum = 0
      while n > 2
        sum = sum + n if n % 3 < 1 || n % 5 < 1
        n = n - 1
      end
      sum
    end

    def benchmark
      Benchmark.ips do |x|
        x.report('base') { solve 999 }
        x.report('itr') { itr_solve 999 }
        x.report('rec') { rec_solve 999 }
        x.compare!
      end
    end
  end

  class ProblemOneTest < Minitest::Test
    def setup
      @problem = ProblemOne.new
    end

    def test_solution
      assert_equal @problem.solve(999), 233_168
    end

    def test_recursive_solution
      assert_equal @problem.rec_solve(999), 233_168
    end

    def test_iterative_solution
      assert_equal @problem.itr_solve(999), 233_168
    end
  end
end

puts Euler::ProblemOne.new.benchmark
