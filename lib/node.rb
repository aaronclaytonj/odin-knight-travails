# frozen_string_literal: true

class Node
  attr_reader :position, :parent

  def initialize(position, parent)
    @position = position
    @parent = parent
  end

  # def knight_move(start, destination)
  #   source = [0, nil]

  # end

  def get_moves(changes)
    moves = changes.map { |change| [position[0] + change[0], position[1] + change[1]] }
    moves = moves.keep_if { |move| valid?(move) }
    moves.map { |move| Node.new(move, self) }
  end

  def valid?(node)
    node[0].between?(0, 7) and node[1].between?(0, 7)
  end
end
