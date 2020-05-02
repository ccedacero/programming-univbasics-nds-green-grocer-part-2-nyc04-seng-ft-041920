require_relative './part_1_solution.rb'



def apply_coupons(shelf,special)
  arr = []
  kt = {}
count = 0
non_discount = nil
clearance = nil
regular_name = nil
price = nil 
discount_name = nil 
shelf.each {|key| 
special.each { |cp| 
 if key[:item] == cp[:item] 
  discount_name = cp[:item] + " W/COUPON"
   non_discount = key[:count] - cp[:num]
  price = cp[:cost].to_f / cp[:num]
  clearance = key[:clearance]
  key[:count] = non_discount
  arr << [:item,discount_name]
  arr << [:price,price]
  arr << [:clearance,clearance]
  arr << [:count, cp[:num]]
  # arr.to_h
  shelf << arr.to_h
end
  }
}
shelf 
end


def apply_clearance(arr) 
  arr.map {|val| 
  # p val 
  if (val[:clearance])
    percentage = (val[:price] / 100) * 20 
    discount = val[:price] - percentage
  if percentage != nil 
    val[:price] = discount
  end 
end
}
deals = arr
deals
end


# consolidate_cart(shelf)
def checkout(shelf, special)
total =0
consolidate_cart(shelf)
# p cart
apply_coupons(shelf,special)
# cart
# apply_clearance(shelf)

shelf.each {|item| total += item[:price] * item[:count]}
total 
if total > 100
xdiscount = total / 100 * 10
total = total - xdiscount
end
total
end
