require 'yaml'
require 'csv_seed'

env = ENV['SEED_ENV'] || Rails.env

# Create Admin
unless env == 'test'
  Operator.first_or_create!(
    email: 'admin@admin.com',
    username: 'Administrator',
    password: 'admin',
    password_confirmation: 'admin',
  )
end

seeds_config = YAML.load_file(Rails.root.join('db', 'seeds', 'seeds_config.yml'))
target_files = seeds_config[env]['table_names'] || []
target_files.each do |table|
  puts "\e[34m[RUNNING] Seeding #{table.camelize}\e[0m"

  duration = Benchmark.realtime do
    CsvSeed.load_file(table)
  end

  puts "\e[32m[COMPLETED] Seeding #{table.camelize} within #{duration.round(2)}s\e[0m"
end
