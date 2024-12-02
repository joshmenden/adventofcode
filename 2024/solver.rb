require "byebug"
require "clipboard"
require "active_support/all"
require "active_model"

require "zeitwerk"
loader = Zeitwerk::Loader.new
loader.push_dir("./lib")
loader.setup

class Solver
  def initialize(test: true)
    @test = test
    @data = if @test
      File.read("sample.txt")
    else
      File.read("input.txt")
    end
    parse_data
  end

  def solve!
    solve_part!(1)
    solve_part!(2)
  end

  def solve_part!(part_number)
    solution = nil
    time = Benchmark.realtime do
      solution = send(:"pt#{part_number}")
    end

    Clipboard.copy(solution)
    puts "#{@test ? "Test " : ""}Part #{part_number} Solution: #{solution} (#{time.round(5)}s)"
  end
end
