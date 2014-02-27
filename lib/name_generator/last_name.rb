module NameGenerator
  class LastName < Base
    def generate
      fetch "last_name.#{rarity}"
    end
  end
end
