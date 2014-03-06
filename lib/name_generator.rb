mydir = File.expand_path(File.dirname(__FILE__))

begin
  require 'psych'
rescue LoadError
end

require 'i18n'
I18n.load_path += Dir[File.join(mydir, 'locales', '*.yml')]
I18n.reload!

module NameGenerator
  class Base
    attr_writer :locale

    def initialize(options={})
      self.locale = options[:locale]
    end

    def locale
      @locale || I18n.locale.downcase
    end

    def rarity
      case rand(0..max_probability)
      when 0..5 then :common
      when 6..8 then :average
      when 9 then :rare
      end
    end

    def name_data(key)
      translate "name_generator.#{key}"
    end

    def max_probability(key)
      name_data.values.max
    end

    def fetch(key)
      name_data(key).
        select { |k,v| v >= rand(0..max_probability) }.keys.sample.
        gsub("\302\240", ' ').strip.capitalize
    end

    def translate(key)
      I18n.translate key, locale: locale
    end
  end
end

require "name_generator/version"
require "name_generator/first_name"
require "name_generator/last_name"
require "name_generator/name"
