=begin

1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

=end

require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  all_cards = {}
  suits = ['diamonds', 'clubs', 'hearts', 'spades']
  
  suits.each do |suit|
    (2..10).each do |num|
      all_cards["#{num} of #{suit}"] = num
    end

    all_cards["jack of #{suit}"] = 10
    all_cards["queen of #{suit}"] = 10
    all_cards["king of #{suit}"] = 10
    all_cards["ace of #{suit}"] = [1, 11]
  end

  all_cards
end

def deal_card(deck)
  card = initialize_deck.keys.sample
  deck.delete(card)
  card
end

def total(values, hand)
  total = 0
  hand.each do |key|
    total += values[key]
  end

  hand.select{|card| card.include?('ace')}.count.times do 
    sum -= 10 if total > 21
  end

  total
end

def joiner(array, separator = ', ', last_word = 'and')
  case array.size
  when 0 then array.join
  when 1 then array.join
  when 2 then array.join( " #{last_word} ")
  else
    array[-1] = "#{last_word} #{array.last}"
    array.join(separator) 
  end
end

def display_greeting
  puts '=' * 60
  puts 'Welcom to Twenty-One!'.center(60)
  puts '=' * 60
  puts "To see the rules, press 'r'."
  puts "To play the game, press 'p'."
end

def display_rules
  system 'clear'
  puts '=' * 60
  puts 'Rules of Twenty-One'.center(60)
  puts '=' * 60
  puts 'Goal:' 
  puts '  - Get as close to 21 without going over.'
  puts '  - If you go over 21, it\'s a "bust" and you lose.'
  puts ''
  puts 'Card Values:'
  puts '  - All cards 2-10 have the same value as their numbers.'
  puts '  - Jack, Queen, and King are worth 10.'
  puts '  - Ace is worth either 1 or 11.'
  puts ''
  puts 'Your turn:'
  puts '  - You can see your hand and one card from the dealer.'
  puts '  - You can choose to either "hit" or "stay".'
  puts '  - If you hit, you get another card. You can hit as much as you like.'
  puts '  - If you stay, your turn ends and it is the dealer\'s turn.'
  puts ''
  puts 'Dealer\'s turn:'
  puts '  - They will choose to hit or stay based on their hand.'
  puts ''
  puts 'Do you want to reset or play? (r/p)'
end

# ======================================================================
#              Methods are above, Game code is below.
# ======================================================================

system 'clear'

display_greeting
answer = nil

loop do 
  answer = gets.chomp.downcase
  if answer == 'p'
    break
  elsif answer == 'r'
    display_rules
    answer = gets.chomp.downcase
  end
  break if answer == 'p'
  puts "Please type 'p' or 'r'."
end

card_values = initialize_deck

deck = initialize_deck.keys

player_hand = [deal_card(deck), deal_card(deck)]
dealer_hand = [deal_card(deck), deal_card(deck)]

prompt "Dealer has: #{dealer_hand[0]} and unknown card."
prompt "You have: #{player_hand[0]} and #{player_hand[1]}."

move = nil
winner = nil

loop do # main game loop
  loop do # Player Turn
    loop do 
      prompt 'What will you do now? Hit or Stay? (h/s)'
      move = gets.chomp.downcase

      break if move == 'h' || move == 's'
      prompt "Please type 'h' for hit or 's' for stay."
      sleep 0.5
    end
    break if move == 's'

    player_hand << deal_card(deck) if move == 'h'
    prompt "Now, you have #{joiner(player_hand)}."
  end

  loop do # Dealer Turn

    break if total(card_values, dealer_hand) >= 17
  end

  break
end

prompt 'Thanks for playing Twenty-One. Goodbye!'
