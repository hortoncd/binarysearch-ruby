require_relative 'spec_helper.rb'
require_relative '../array_binarysearch.rb'

describe Array do
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

  @arrays.each do |a|
    it 'returns -1 or the appropriate index for binsearch if key is found' do
      ret = a['array'].binsearch(0, a['array'].length - 1, a['key'])
      expect(ret).to eq(a['ans'])
    end

    it 'returns -1 or the appropriate index for binary_search wrapper if key is found' do
      ret = a['array'].binary_search(a['key'])
      expect(ret).to eq(a['ans'])
    end
  end
end
