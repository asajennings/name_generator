require 'name_generator'

describe NameGenerator::Name do
  describe '#generate' do
    it 'returns a string' do
      expect(NameGenerator::Name.new( locale: :en ).generate).to be_instance_of String
    end
  end
end
