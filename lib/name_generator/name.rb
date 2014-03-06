module NameGenerator
  class Name < Base
    def generate
      if only_standalone_names?
        standalone
      elsif has_standalone_names?
        self.send [:standard, :standard, :standalone].sample
      else
        standard
      end
    end

    def standalone
      StandaloneName.new( locale: locale ).generate
    end

    def standard
      name_parts = [FirstName.new( locale: locale ).generate]
      name_parts << MiddleName.new( locale: locale ).generate if has_middle_names? && [true, false, false].sample
      name_parts << LastName.new( locale: locale ).generate
      name_parts.compact.join(' ')
    end
  end
end
