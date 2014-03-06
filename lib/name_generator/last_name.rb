module NameGenerator
  class LastName < Base
    def generate
      fetch "last_name"
    end
  end
end
