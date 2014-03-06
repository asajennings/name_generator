module NameGenerator
  class MiddleName < Base
    def generate
      fetch "middle_name.male" #TODO: handle gneder
    end
  end
end
