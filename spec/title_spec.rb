require "title" 

describe Title do
  it "must be under 50 characters long" do
    expect{ Title.validate("a" * 100) }.to raise_error "Title invalid: exceeds 50 characters"
  end 
end