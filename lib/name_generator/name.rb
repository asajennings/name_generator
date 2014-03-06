module NameGenerator
  class Name < Base
    def generate
      options = { locale: locale }
      if only_standalone?
        standalone
      elsif has_standalone?
        self.send [:first_last, :first_last, :standalone].sample
      else
        first_last
      end
    end

    def standalone
      StandaloneName.new(options).generate
    end

    def first_last
      "#{FirstName.new(options).generate} #{LastName.new(options).generate}"
    end
  end
end
