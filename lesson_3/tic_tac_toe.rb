require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts 'Best of 5 wins.'
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, separator = ', ', last_word = 'or')
  case array.size
  when 0 then array.join
  when 1 then array.join
  when 2 then array.join( " #{last_word} ")
  else
    array[-1] = "#{last_word} #{array.last}"
    array.join(separator) 
  end
end

def player_marks!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def ideal_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k,v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def computer_marks!(brd)
  square = nil

  WINNING_LINES.each do |line|      
    square = ideal_square(line, brd, PLAYER_MARKER)  # defense
    break if square                                  
  end

  if !square
    WINNING_LINES.each do |line|
      square = ideal_square(line, brd, COMPUTER_MARKER)  # offense
      break if square                                  
    end
  end

  if !square
    square = empty_squares(brd).sample # chooses randomly if there is no ideal square
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # a double bang converts to a boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board
  display_board(board)

  loop do # main game loop
    display_board(board)

    puts "Player: #{player_score} Computer: #{computer_score}"

    player_marks!(board)
    break if someone_won?(board) || board_full?(board)

    computer_marks!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"

    if detect_winner(board) == 'Player'
      player_score += 1
    elsif detect_winner(board) == 'Computer'
      computer_score += 1
    end
  
  else
    prompt "It's a tie! Both get points!"
    player_score += 1
    computer_score += 1
  end

  break if player_score == 5 || computer_score == 5 
  
  prompt "Continue? (y/n)"
  answer = gets.chomp
  break if answer.downcase.start_with?('n')
end

if computer_score == 5
  prompt 'Computer is the ultimate winner!'
elsif player_score == 5
  prompt 'Player is the ultimate winner!'
end

prompt 'Thanks for playing Tic Tac Toe! Goodbye.'
