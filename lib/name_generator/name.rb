module NameGenerator
  class Name < Base
    def generate
      if only_standalone?
        standalone
      elsif has_standalone?
        self.send [:first_last, :first_last, :standalone].sample
      else
        first_last
      end
    end

    def standalone
      StandaloneName.new( locale: locale ).generate
    end

    def first_last
      "#{FirstName.new( locale: locale ).generate} #{LastName.new( locale: locale ).generate}"
    end
  end
end
