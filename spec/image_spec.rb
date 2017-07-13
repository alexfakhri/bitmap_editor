require 'image'

describe Image do

  subject { described_class.new(5, 5) }

  it 'has a defualt value' do
    expect(described_class::DEFAULT_VALUE).to eq 'O'
  end

  it "initializes with an image grid filled with 'O'" do
    expect(subject.image).to eq [["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"]]
  end

  it 'will raise an error if dimensions are too big' do
    expect{ described_class.new(255, 5) }.to raise_error "Maximum size of #{described_class::MAX_IMAGE_SIZE} x #{described_class::MAX_IMAGE_SIZE} exceeded"
  end

  it 'can colour one pixel' do
    subject.colour_pixel(3,2, 'C')
    expect(subject.image).to eq [["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "C", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"]]
  end

  it "can reset all pixels back to 'O'" do
    subject.colour_pixel(1,1, 'C')
    subject.clear_image
    expect(subject.image).to eq [["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"]]
  end

  it "can fill pixels in a horizontal line" do
    subject.horizontal_line(2, 4, 3, 'C')
    expect(subject.image).to eq [["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "C", "C", "C", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"]]
  end

  it "can fill pixels in a verticle line" do
    subject.verticle_line(3, 1, 3, 'C')
    expect(subject.image).to eq [["O", "O", "C", "O", "O"],
                                 ["O", "O", "C", "O", "O"],
                                 ["O", "O", "C", "O", "O"],
                                 ["O", "O", "O", "O", "O"],
                                 ["O", "O", "O", "O", "O"]]
  end

  it 'can display the image' do
    expect(STDOUT).to receive(:puts).with("O O O O O").exactly(5).times
    subject.show_image
  end

end
