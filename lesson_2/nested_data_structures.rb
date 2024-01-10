arr = [[1, 3], [2]]

arr[0]    # => [1, 3]
arr[0][1] # => 3

arr = [[1, 3], [2]]
arr[1] = "hi there"
arr # => [[1, 3], "hi there"]

arr = [[1, 3], [2]]
arr[0][1] = 5

[{ a: 'ant' }, { b: 'bear' }]

arr = [{ a: 'ant' }, { b: 'bear' }]

arr[0][:c] = 'cat'
arr # => [{ :a => "ant", :c => "cat" }, { :b => "bear" }]

arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

arr[0]        # => ["a", ["b"]]
arr[0][1][0]  # => "b"
arr[1]        # => { :b => "bear", :c => "cat" }
arr[1][:b]    # => "bear"
arr[1][:b][0] # => "b"
arr[2][2]     # => "b"


