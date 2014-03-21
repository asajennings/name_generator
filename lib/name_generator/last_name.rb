module NameGenerator
  class LastName < Base
    def generate
      if should_be_double_barrel?
        "#{fetch("last_name")}-#{fetch("last_name")}"
      else
        fetch "last_name"
      end
    end

    private

    def should_be_double_barrel?
      rand(0..99) == 0
    end
  end
end
