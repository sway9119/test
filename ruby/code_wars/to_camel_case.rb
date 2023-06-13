def to_camel_case(str)
  return "" if str.empty?
  camel_str = str.split(/-|_/).map{|w| w.capitalize }.join 
  camel_str = camel_str.sub(/^./, str[0])
end

Test.assert_equals(to_camel_case(''), '', "An empty string was provided but not returned")
Test.assert_equals(to_camel_case("the_stealth_warrior"), "theStealthWarrior", "to_camel_case('the_stealth_warrior') did not return correct value")
Test.assert_equals(to_camel_case("The-Stealth-Warrior"), "TheStealthWarrior", "to_camel_case('The-Stealth-Warrior') did not return correct value")
Test.assert_equals(to_camel_case("A-B-C"), "ABC", "to_camel_case('A-B-C') did not return correct value")


# リファクタリング
def to_camel_case(str)
  head, *tail = str.split(/[-_]/)
  head.to_s + tail.map(&:capitalize).join
end