module NameGenerator
  class FirstName < Base
    def generate
      fetch "first_name.male" #TODO: handle gneder
    end
  end
end
