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
    @data.count do |report|
      report.combination(report.length - 1).any? do |combo|
        (combo == combo.sort || combo == combo.sort.reverse) &&
          combo.each_cons(2).all? { |a, b| (a - b).abs >= 1 && (a - b).abs <= 3 }
      end
    end
  end
end

filename = "input.txt"
Day.new(filename).solve!
