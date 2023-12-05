produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  selected_fruits = {}
  keys = hash.keys  # makes an array of all keys
  counter = 0       # used on `keys` array

  loop do
    break if counter == keys.size

    current_key = keys[counter]
    current_value = hash[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    
    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end

double_numbers!(my_numbers)
p my_numbers

my_numbers = [1, 4, 3, 7, 2, 6]

def double_odd_numbers(numbers)
  counter = 0
  new_numbers = []
  
  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if current_number.odd?
    new_numbers << current_number 

    counter += 1
  end

  new_numbers
end

p double_odd_numbers(my_numbers)

def double_odd_indices(numbers)
  counter = 0
  new_numbers = []
  
  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    new_numbers << current_number 

    counter += 1
  end

  new_numbers
end

p double_odd_indices(my_numbers)

def multiply(numbers, value)
  counter = 0
  products = []
  
  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= value
    products << current_number 

    counter += 1
  end

  products
end

p multiply(my_numbers, 3)
