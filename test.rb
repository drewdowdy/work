# Paste some code here and execute it. When finished, erase it.

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
    all_cards["ace of #{suit}"] = 11
  end

  all_cards
end

def who_wins?(player_hand, dealer_hand)
  values = initialize_deck
  player_total = 0
  dealer_total = 0

  player_hand.each do |card|
    num1 = values[card]
    player_total += num1
  end

  dealer_hand.each do |card|
    num2 = values[card]
    dealer_total += num2
  end

  if player_total > 21 || (21 - player_total).abs > (21 - dealer_total).abs
    return 'Dealer'
  elsif dealer_total > 21 || (21 - dealer_total).abs > (21 - player_total).abs
    return 'Player'
  elsif player_total == dealer_total
    return 'Everyone'
  end
end

p who_wins?(['10 of spades', '5 of diamonds', '3 of spades'], ['10 of diamonds', '5 of hearts'])
