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


