def nb_year(p0, percent, aug, p)
  wp = p0
  year = 0
  while wp < p
    wp = wp + ( wp * percent / 100 ).floor + aug 
    year += 1
  end
  return year
end

describe("nb_year") do
  it("Basic tests") do
      Test.assert_equals(nb_year(1500, 5, 100, 5000), 15)
      Test.assert_equals(nb_year(1500000, 2.5, 10000, 2000000), 10)
      Test.assert_equals(nb_year(1500000, 0.25, 1000, 2000000), 94)
  end 
end