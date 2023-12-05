# @param {Integer} n
# @return {Integer}
def number_of_matches(n)
  result = 0
  team = n
  while team > 1 do
    result += team/2.to_f.floor
    team = (team + 1)/2
  end
  result
end
