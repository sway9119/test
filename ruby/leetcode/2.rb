# 感想
# ノードの探索には再帰処理が有効

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  @sum = 0
  @list = []
  saiki(l1)
  @list = []
  saiki(l2)
  retsum
end

def saiki(node)
  @list.push(node.val)
  if node.next != nil
    saiki(node.next)
  else
    @sum += @list.reverse.join.to_i
  end
end

def retsum
  ret = @sum.to_s.chars.reverse.map{|c| c.to_i}
  return ret
end


# l1 = [2,4,3]
l1_last_node = ListNode.new(3, nil)
l1_second_node = ListNode.new(4, l1_last_node)
l1 = ListNode.new(2, l1_second_node)

# l2 = [5,6,4]
l2_last_node = ListNode.new(4, nil)
l2_second_node = ListNode.new(6, l2_last_node)
l2 = ListNode.new(5, l2_second_node)

p add_two_numbers(l1,l2)




# リファクタリング
# def add_two_numbers(l1, l2)
#   add_two_numbers_with_overflow(l1, l2, false)
# end

# def add_two_numbers_with_overflow(l1, l2, overflow)
#   return unless l1 || l2 || overflow
#   val = (l1&.val || 0) + (l2&.val || 0) + (overflow ? 1 : 0)
#   val -= 10 if (overflow = val >= 10)
#   ListNode.new(val, add_two_numbers_with_overflow(l1&.next, l2&.next, overflow))
# end
