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

    def name_data
      translate "name_generator.#{@key}"
    end

    def max_probability
      name_data.values.max
    end

    def fetch(key)
      @key = key
      name_data.
        select { |k,v| v >= rand(0..max_probability) }.keys.sample.
        to_s.gsub("\302\240", ' ').strip.capitalize
    end

    def translate(key)
      I18n.translate key, locale: locale, default: {}
    end
  end
end

require "name_generator/version"
require "name_generator/first_name"
require "name_generator/last_name"
require "name_generator/name"
