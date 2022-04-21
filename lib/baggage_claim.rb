# frozen_string_literal: true

require_relative 'baggage_claim/version'
require 'active_support/inflections'
require 'YAML'

module BaggageClaim
  class Error < StandardError; end
  class Classifier
    include ActiveSupport::Inflector

    def initialize(country_name)
      @country_name = country_name
    end

    def adjectival
      adjectivals = File.read(en_locale_file_path)
      loaded_yaml = YAML.load(adjectivals)
      if loaded_yaml[titlized_country].nil?
        titlized_country
      else
        loaded_yaml[titlized_country]
      end
    end

    def self.adjectival(country_name)
      new(country_name).adjectival
    end

    def titlized_country
      titleize(@country_name)
    end

    private

    def en_locale_file_path
      gem_root_path = File.expand_path("../..", __FILE__)
      "#{gem_root_path}/locale/en/country_adjectivals.yml".freeze
    end
  end
end

class String
  def adjectival
    BaggageClaim::Classifier.adjectival(self)
  end
end

