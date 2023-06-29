def zeros(n)
  p "fact: #{fact(n)}"
  a = fact(n).to_s.split("").reverse
  i = 0
  count = 0
  p a
  while a[i] === "0"
    p a[i]
    count += 1
    i += 1
  end
  p count
  return count
end

def fact(n)
  (1..n).to_a.inject(1) {|f, i| f*i}
end


describe "Sample Tests" do
  it "Should pass sample tests" do
    Test.assert_equals(zeros(0), 0, "Testing with n = 0")
    Test.assert_equals(zeros(6), 1, "Testing with n = 6")
    Test.assert_equals(zeros(30), 7, "Testing with n = 30")
  end  
end