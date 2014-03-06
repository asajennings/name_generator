module NameGenerator
  class StandaloneName < Base
    def generate
      fetch "standalone_name.male" #TODO: handle gneder
    end
  end
end
