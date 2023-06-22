def is_valid_walk(walk)
  return false unless walk.length == 10
  return walk.count('n') == walk.count('s') && walk.count('e') == walk.count('w') ? true : false
end

describe "Sample tests" do
  it "Some examples" do
    expect(is_valid_walk(['n','s','n','s','n','s','n','s','n','s'])).to eq(true)
    expect(is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e'])).to eq(false)
    expect(is_valid_walk(['w'])).to eq(false)
    expect(is_valid_walk(['n','n','n','s','n','s','n','s','n','s'])).to eq(false)
  end
end

# リファクタリング
def isValidWalk(walk)
	walk.count('w') == walk.count('e') and
  walk.count('n') == walk.count('s') and
  walk.count == 10
end

# andで改行できるし、length, size, countで何を選ぶべきか。