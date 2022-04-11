shared_examples 'South Slavic' do
  it 'has "one", "few", and "other" plural keys' do
    plural_keys.size.should == 3
    plural_keys.should include(:one, :few, :other)
  end

  [1, 21, 31, 41, 51, 61, 81, 101, 1031].each do |count|
    it "detects that #{count} in category 'one'" do
      rule.call(count).should == :one
    end
  end

  [2, 3, 4, 22, 23, 24, 102, 1034].each do |count|
    it "detects that #{count} in category 'few'" do
      rule.call(count).should == :few
    end
  end

  [0.11, 0.13, 56.78, 11, 12, 13, 14, 15, 27, 100, 1012].each do |count|
    it "detects that #{count} in category 'other'" do
      rule.call(count).should == :other
    end
  end
end
