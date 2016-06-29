module Euler
  class ProblemOne
    def solve n
      (1..n).select { |n| n % 3 < 1 || n % 5 < 1 }.inject(:+)
    end
  end
end

puts Euler::ProblemOne.new.solve 999
