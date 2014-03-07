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

    def name_data(options={})
      p "key is #{options.fetch(:key, @key)}"
      translate "name_generator.#{options.fetch(:key, @key)}"
    end

    def max_probability
      name_data.values.max
    end

    def fetch(key)
      @key = key
      p "max_probability is #{max_probability}"
      r = rand(0..max_probability)
      name_data.
        select { |k,v| v >= r }.keys.sample.
        to_s.gsub("\302\240", ' ').strip.capitalize
    end

    def translate(key)
      p "locale is #{locale}"
      I18n.translate key, locale: locale, default: {}
    end

    def has_standalone_names?
      name_data( key: :standalone_name ).any?
    end

    def only_standalone_names?
      name_data( key: :first_name ).empty? || name_data( key: :last_name ).empty?
    end

    def has_middle_names?
      name_data( key: :middle_name ).any?
    end
  end
end

require "name_generator/version"
require "name_generator/first_name"
require "name_generator/middle_name"
require "name_generator/last_name"
require "name_generator/standalone_name"
require "name_generator/name"
