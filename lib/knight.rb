# frozen_string_literal: true

require_relative 'node'

class Knight
  attr_reader :history

  CHANGES = [[-2, 1], [-2, -1], [-1, 2], [-1, -2], [1, 2], [1, -2], [2, 1], [2, -1]].freeze

  def initialize
    @history = []
  end

  def knight_move(start, destination)
    queue = []
    curr_node = Node.new([start[0], start[1]], nil)
    until curr_node.position == destination
      curr_node.get_moves(CHANGES).each { |node| queue.push(node) }
      curr_node = queue.shift
    end
    display_moves(curr_node)
  end

  def display_moves(node)
    display_moves(node.parent) unless node.parent.nil?
    p node.position
  end
end
