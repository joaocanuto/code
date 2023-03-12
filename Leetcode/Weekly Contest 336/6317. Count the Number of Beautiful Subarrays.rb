# @param {Integer[]} nums
# @return {Integer}
def beautiful_subarrays(nums)
  count = 0
  p nums.inspect
  if nums.length == 1
    return 1 if nums[0] == 0
    return 0
  end
  for i in 0..nums.length - 1
    for j in i+1..nums.length - 1
      aux = nums[i..j].sort_by { |a| -a}

      while(aux.length > 1)
        aux = aux.sort_by { |a| -a}
        a = aux[0]
        b = aux[1]
        if (a == 0 && b == 0)
          count += 1
          break
        end
        if (a != 0 && b == 0)
          break
        end

        aux.delete_at(0)
        aux.delete_at(0)
        and_op = a & b
        a = a - and_op
        b = b - and_op
        if and_op == 0
          break
        end
        aux.push(a)
        aux.push(b)
      end
    end
  end
  count
end

def making_or_operation_between_numbers(a, b)
  a | b
end

def making_and_operation_between_numbers(a, b)
  a & b
end
nums = [0]
p beautiful_subarrays(nums)

