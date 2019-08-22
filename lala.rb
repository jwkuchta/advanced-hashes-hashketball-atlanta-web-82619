num = [2, 4, 6, 8]

def sum(ar)
  ar.reduce(0) {|sum, el| sum + el}
end
