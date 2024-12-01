#!/usr/bin/env ruby

require 'byebug'
require 'active_support/all'
require_relative '../aoc_solution'

class Day < AOCSolution
  def parse_data
    @data = @data.split("\n").map { |line| line.split(/\s+/).map(&:to_i) }
  end

  # 0.00069s
  def pt1
    @data.transpose.map(&:sort).transpose.map { |a, b| (a - b).abs }.sum
  end

  # 0.00013s
  def pt2
    left, right = @data.transpose
    tally = right.tally
    left.reduce(0) { |acc, num| acc + ((tally[num] || 0) * num) }
  end
end

filename = 'input.txt'
Day.new(filename).solve!
