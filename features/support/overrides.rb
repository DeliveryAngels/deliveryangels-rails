# frozen_string_literal: true

# rubocop:disable Style/ClassVars

# rubocop:disable Metrics/AbcSize

# rubocop:disable Metrics/MethodLength

module FixtureAccess
  def self.extended(base)
    fixtures_folder = File.join(Rails.root, "spec", "fixtures")

    fixtures = Dir[File.join(fixtures_folder, "*.yml")].map do |f|
      File.basename(f, ".yml")
    end

    fixtures += Dir[File.join(fixtures_folder, "*.csv")].map do |f|
      File.basename(f, ".csv")
    end

    ActiveRecord::FixtureSet.reset_cache
    ActiveRecord::FixtureSet.create_fixtures(fixtures_folder, fixtures)

    (class << base; self; end).class_eval do
      @@fixture_cache = {}
      fixtures.each do |table_name|
        table_name = table_name.to_s.tr(".", "_")
        define_method(table_name) do |*fixture_symbols|
          @@fixture_cache[table_name] ||= {}

          instances = fixture_symbols.map do |fixture_symbol|
            fix = ActiveRecord::FixtureSet.cached_fixtures(
              ActiveRecord::Base.connection, table_name
            ).first.fixtures[fixture_symbol.to_s]

            raise StandardError, "No fixture with name '#{fixture_symbol}' found for table '#{table_name}'" unless fix

            @@fixture_cache[table_name][fixture_symbol] ||= fix.find
          end
          instances.size == 1 ? instances.first : instances
        end
      end
    end
  end
end

World(FixtureAccess)

# rubocop:enable Style/ClassVars

# rubocop:enable Metrics/MethodLength

# rubocop:enable Metrics/AbcSize

