require "byebug"
require "clipboard"
require "active_support/all"

require "zeitwerk"
loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/lib")
loader.setup

class Solver
  include Numericable
  include Arrayable

  attr_accessor :data
  def initialize(test: false)
    @test = test
    @data = if @test
      File.read("sample.txt")
    else
      File.read("input.txt")
    end
    parse_data
  rescue Errno::ENOENT # Can't find file
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
