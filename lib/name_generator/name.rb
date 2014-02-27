module NameGenerator
  class Name < Base
    def generate
      "#{FirstName.new( locale: locale ).generate} #{LastName.new( locale: locale ).generate}"
    end
  end
end
