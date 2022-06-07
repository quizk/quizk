require 'yaml'
require 'csv_seed'

env = ENV['SEED_ENV'] || Rails.env

# Create Admin
Operator.first_or_create!(
  username: 'admin',
  first_name: 'Admin',
  last_name: 'istrator',
  password: 'admin',
  password_confirmation: 'admin',
) unless env == 'test'

seeds_config = YAML.load_file(Rails.root.join('db', 'seeds', 'seeds_config.yml'))
target_files = seeds_config[env]['table_names'] || []
target_files.each do |table|
  puts "Start loading #{table}.csv"

  duration = Benchmark.realtime do
    CsvSeed.load_file(table)
  end

  puts "Complete loading #{table}.csv within #{duration.round(2)}s"
end
