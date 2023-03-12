# @param {Integer[]} nums
# @return {Integer}
def max_score(nums)
  nums.sort_by!{|x| -x}
  sum = 0
  nums.each_with_index do |num,i|
    nums[i] = nums[i-1] + nums[i] if i > 0
    if nums[i] > 0
      sum += 1
    end
  end
  sum
end

nums = [-2,-3,0]
puts max_score(nums)
