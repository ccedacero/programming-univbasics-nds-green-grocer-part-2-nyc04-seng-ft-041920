def find_item_by_name_in_collection(name, collection)
  index = 0

  collection.each do |grocery_item|
    return grocery_item if grocery_item[:item] === name 
    index += 1
  end

  nil
end


def consolidate_cart(arr)
cart = [];
# arr2 = [];
count = 0 
current_quant = 0 
arr.each do |val|
  item = val
  item[:count] = 0 
  cart << item 
end 
cart.uniq!
cart.each do |i|
  arr.each do |item|
  if (i[:item] == item[:item])
    i[:count] +=1
  end
end
end
cart
end