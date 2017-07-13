require 'bitmap_editor'

describe BitmapEditor do

  let(:subject) { described_class.new }
  let(:image) {Image.new(5, 6)}


  it 'raises an error if no file is provided' do
    expect(STDOUT).to receive(:puts).with("please provide correct file")
    subject.run('somefile.txt')
  end

  it 'has a hash of commands' do
    expect(described_class::COMMANDS).to eq ({'C' => :clear_image, 'L' => :colour_pixel, 'V' => :verticle_line, 'H' => :horizontal_line, 'S' => :show_image, 'I' => :new_image })
  end

  it 'should create a new image' do
    subject.commands("I 3 3")
    expect(subject.commands("S")).to eq [["O", "O", "O"], ["O", "O", "O"], ["O", "O", "O"]]
  end

  it 'returns an image with a single coordinate on the image' do
    subject.commands("I 3 3")
    subject.commands("L 1 3 A")
    expect(subject.commands("S")).to eq [["O", "O", "A"], ["O", "O", "O"], ["O", "O", "O"]]
  end

  it 'returns an image with a verticle line on the image' do
    subject.commands("I 3 3")
    subject.commands("V 2 1 3 W")
    expect(subject.commands("S")).to eq [["O", "W", "O"], ["O", "W", "O"], ["O", "W", "O"]]
  end

  it 'returns an image with a horizontal line on the image' do
    subject.commands("I 3 3")
    subject.commands("V 2 1 3 W")
    expect(subject.commands("S")).to eq [["O", "W", "O"], ["O", "W", "O"], ["O", "W", "O"]]
  end

end
