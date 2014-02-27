require 'name_generator'

describe NameGenerator::LastName do
  describe "#generate" do
    context "with a locale provided" do
      it "returns a string" do
        expect(NameGenerator::LastName.new( locale: :en ).generate).to be_instance_of String
      end
    end
    context "without a locale provided" do
      it "returns a string" do
        expect(NameGenerator::LastName.new.generate).to be_instance_of String
      end
    end
  end
end
