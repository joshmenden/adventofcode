#!/usr/bin/env ruby

require_relative "../aoc_solution"

class Day < AOCSolution
  def parse_data
    @data = @data.split("\n").map { |line| line.split(/\s+/).map(&:to_i) }
  end

  def pt1
    @data.count do |report|
      (report == report.sort || report == report.sort.reverse) &&
        report.each_cons(2).all? { |a, b| (a - b).abs >= 1 && (a - b).abs <= 3 }
    end
  end

  def pt2
  end
end

filename = "input.txt"
Day.new(filename).solve!
