#!/usr/bin/env ruby

require 'byebug'
require 'active_support/all'
require_relative '../aoc_solution'

class Day < AOCSolution
  def parse_data
    @data = @data.split("\n").map { |line| line.split(/\s+/).map(&:to_i) }
  end

  def pt1
    @data.transpose.map(&:sort).transpose.map { |a, b| (a - b).abs }.sum
  end

  def pt2; end
end

filename = 'input.txt'
Day.new(filename).solve!
