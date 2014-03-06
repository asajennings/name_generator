module NameGenerator
  class Name < Base
    def generate
      options = { locale: locale }
      first_name = FirstName.new(options).generate
      last_name = LastName.new(options).generate
      binding.pry
      if first_name && last_name then "#{first_name} #{last_name}" else "#{StandaloneName.new(options).generate}" end
    end
  end
end
