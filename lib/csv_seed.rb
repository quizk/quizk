require 'csv'

module CsvSeed
  BASE_PATH = Rails.root.join('db', 'seeds', 'csv').to_s.freeze
  BATCH_SIZE = 1000

  class << self
    def load_file(file)
      model_class = Module.const_get(file.classify)

      CSV.foreach(file_path(file), headers: true).each_slice(BATCH_SIZE) do |rows|
        hashes = rows.collect { |r| r.to_hash.symbolize_keys }
        result = model_class.import(hashes,
                                    on_duplicate_key_update: model_class.column_names,
                                    batch_size: BATCH_SIZE,)
        raise "Error has occured when import #{model_class}" unless result.failed_instances.empty?
      end
    rescue Errno::ENOENT => e
      puts "[WARNING] Can not read #{file}.csv for reason: #{e.message}"
    end

    def file_path(file)
      "#{BASE_PATH}/#{file}.csv"
    end
  end
end
