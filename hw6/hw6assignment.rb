  # University of Washington, Programming Languages, Homework 6, hw6runner.rb

  # This is the only file you turn in, so do not modify the other files as
  # part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  All_My_Pieces = [
    [[[0, 0], [1, 0], [0, 1], [1, 1]]],  # square (only needs one)
    rotations([[0, 0], [-1, 0], [1, 0], [0, -1]]), # T
    [[[0, 0], [-1, 0], [1, 0], [2, 0]], # long (only needs two)
    [[0, 0], [0, -1], [0, 1], [0, 2]]],
    rotations([[0, 0], [0, -1], [0, 1], [1, 1]]), # L
    rotations([[0, 0], [0, -1], [0, 1], [-1, 1]]), # inverted L
    rotations([[0, 0], [-1, 0], [0, -1], [1, -1]]), # S
    rotations([[0, 0], [1, 0], [0, -1], [-1, -1]]),
    rotations([[0, 0], [1, 0], [0, 1], [1, 1], [0,2] ]), #cube +1
    rotations([[0, 0], [-1, 0], [1, 0], [2, 0],[-2,0]]), #long +1,
    rotations([[0, 0], [1, 0], [0, 1]]) # cube -1, not allowed to have only 3 coordinates?
    # [[[0, 0]]] # test cheat_piece
  ] # Z

  CheatPiece = [[[[0, 0]]]] # cheat piece
  # your enhancements here
  def initialize(point_array, board)
      super(point_array, board)
      @block_len = point_array.length
  end

  def get_len
    @block_len
  end

  def self.next_piece (board)
      MyPiece.new(All_My_Pieces.sample, board)
  end
  def self.cheat_piece (board)
      MyPiece.new(CheatPiece.sample, board)
  end


end

class MyBoard < Board
  # your enhancements here
  def initialize(game)
      super(game)
      @current_block = MyPiece.next_piece(self)
      @is_cheat = false
  end
  def cheat
    if score >= 100 and @is_cheat == false
      @is_cheat = true
      @score -= 100
    end
  end

  def next_piece
      if @is_cheat
        @current_block = MyPiece.cheat_piece(self)
      else
        @current_block = MyPiece.next_piece(self)
      end
      @current_pos = nil
      @is_cheat = false

  end

  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    block_len = locations.length
    block_len -= 1 
    (0..block_len).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end

end

class MyTetris < Tetris
  # your enhancements here

  def set_board
      @canvas = TetrisCanvas.new
      @board = MyBoard.new(self)
      @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
      @board.draw
  end




  def key_bindings  
      super
      @root.bind('u' , proc {
        @board.rotate_clockwise
        @board.rotate_clockwise
      })
      @root.bind('c' , proc {
        @board.cheat
      })
  end

end


