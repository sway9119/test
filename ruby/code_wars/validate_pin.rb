def validate_pin(pin)
  return false if pin.empty?||pin.match(/[^0-9]/)
  return pin.delete("^0-9").match?(/^([0-9]{4}|[0-9]{6})$/)  
end


describe "Solution" do
  it "Fixed tests" do
    Test.assert_equals(validate_pin(""),false)
    Test.assert_equals(validate_pin("1"),false)
    Test.assert_equals(validate_pin("1111"),true)
    Test.assert_equals(validate_pin("123456"),true)
    Test.assert_equals(validate_pin("1234567890"),false)
    Test.assert_equals(validate_pin("12"),false)
  end
end