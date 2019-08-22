alice = [3, 4, 6]
bob = [1, 5, 6]

def compareTriplets(a, b)
  sum_a = 0
  sum_b = 0
  i = 0
  result = []
  while i < a.length do
    if a[i] > b[i]
      sum_a += 1
    elsif a[i] < b[i]
      sum_b += 1
    end
    i +=1
  end
  result.push(sum_a, sum_b)
end

puts compareTriplets(alice, bob)
