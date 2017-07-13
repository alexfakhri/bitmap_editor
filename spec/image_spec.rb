require 'image'

describe Image do

  subject { described_class.new(5, 5) }

  it "initializes with an image grid filled with 'O'" do
    expect(subject.image).to eq [["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"]]
  end

  it 'has a defualt value' do
    expect(described_class::DEFAULT_VALUE).to eq 'O'
  end


end
