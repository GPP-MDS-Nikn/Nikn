class Parser < ActiveRecord::Base

  def self.importCare(file)
      CSV.foreach(file.path, headers: true, encoding: "UTF-8") do |row|
        CareUnit.create! row.to_hash
      end
  end
  def self.importRate(file)
      CSV.foreach(file.path, headers: true, encoding: "UTF-8") do |row|
        MortalityRate.create! row.to_hash
      end
  end

end
