#!/usr/bin/env ruby

require_relative "../solver"

class Puzzle < Solver
  def pt1
    @data.scan(/mul\(\d{1,3},\d{1,3}\)/).map { |cmd| cmd.scan(/\d+/) }.reduce(0) { |acc, (a, b)| acc + (a.to_i * b.to_i) }
  end

  def pt2
    enabled = true
    @data.scan(/mul\(\d{1,3},\d{1,3}\)|don't\(\)|do\(\)/).reduce(0) do |acc, cmd|
      if cmd == "don't()"
        enabled = false

        acc
      elsif cmd == "do()"
        enabled = true

        acc
      elsif enabled
        acc + cmd.scan(/\d+/).map(&:to_i).reduce(1, :*)
      else
        acc
      end
    end
  end
end

Puzzle.new.solve!
