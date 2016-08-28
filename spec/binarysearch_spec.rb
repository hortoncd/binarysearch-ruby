require_relative 'spec_helper.rb'
require_relative '../binarysearch.rb'

describe BinarySearch do
  @arrays  = [
    {'array' => [], 'key' => 4, 'ans' => -1},
    {'array' => [1,2,3,4], 'key' => 3, 'ans' => 2},
    {'array' => [1,2,3,4], 'key' => 7, 'ans' => -1},
    {'array' => [8,9,10,11], 'key' => 7, 'ans' => -1},
    {'array' => [8,10,9,11], 'key' => 9, 'ans' => -1}, # incorrectly sorted
    {'array' => [3,5,8,10,12,15,18,20,20,50,60], 'key' => 50, 'ans' => 9},
    {'array' => [1,5,8,12,13], 'key' => 8, 'ans' => 2},
    {'array' => [1,5,8,12,13], 'key' => 1, 'ans' => 0},
    {'array' => [1,5,8,12,13], 'key' => 23, 'ans' => -1},
    {'array' => [1,5,8,12,13], 'key' => 1, 'ans' => 0},
    {'array' => [1,5,8,12,13], 'key' => 11, 'ans' => -1},
  ]

  before :each do
    @bs = BinarySearch.new
  end

  it 'sets an array' do
    @bs.array = [0, 1, 2]
    expect(@bs.array).to eq([0, 1, 2])
  end

  it 'returns -1 for search of nil array' do
    @bs.array = nil
    ret = @bs.binsearch(0, 0, 4)
    expect(ret).to eq(-1)
  end

  it 'returns -1 for wrapper search of nil array' do
    @bs.array = nil
    ret = @bs.search(4)
    expect(ret).to eq(-1)
  end

  @arrays.each do |a|
    it 'returns -1 or the appropriate index for binsearch if key is found' do
      @bs.array = a['array']
      ret = @bs.binsearch(0, @bs.array.length - 1, a['key'])
      expect(ret).to eq(a['ans'])
    end

    it 'returns -1 or the appropriate index for search wrapper if key is found' do
      @bs.array = a['array']
      ret = @bs.search(a['key'])
      expect(ret).to eq(a['ans'])
    end
  end
end
