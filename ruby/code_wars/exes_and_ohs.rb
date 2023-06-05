def XO(str)
  return str.downcase.count("x") == str.downcase.count("o")
end

describe 'Sample tests' do
  it "should pass sample tests" do  
    expect(XO('xo')).to be true
    expect(XO('XO')).to be true
    expect(XO('xo0')).to be true
    expect(XO('xxxoo')).to be false
    expect(XO("xxOo")).to be true
  end    
end