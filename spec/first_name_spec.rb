require 'name_generator'

describe NameGenerator::FirstName do
  describe ".generate" do
    context "with a locale provided" do
      it "returns a string" do
        expect(NameGenerator::FirstName.new( locale: :en ).generate).to be_instance_of String
      end
    end
    context "without a locale provided" do
      it "returns a string" do
        expect(NameGenerator::FirstName.new.generate).to be_instance_of String
      end
    end
  end
end
