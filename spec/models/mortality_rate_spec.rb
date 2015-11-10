require 'rails_helper'

describe MortalityRate do
  context "when providing valid data" do
  	# Valid tests
		it "should be an instance of MortalityRate" do
			mortality_rate = create_mortality_rate # Only valid data
			expect(mortality_rate).to be_instance_of(MortalityRate)
		end
  end

  context "when providing invalid data" do
  	# Region tests
		it "should be invalid without a region" do
			mortality_rate = create_mortality_rate(regiao: nil)
			expect(mortality_rate.valid?).to be false
			#expect(mortality_rate.errors[:region].size).to be > 0 # weird sintax to cat errors
		end

		# Name tests
		it "should be invalid without a name" do
			mortality_rate = create_mortality_rate(nome: nil)
			expect(mortality_rate.valid?).to be false
		end

		# Rate tests
		it "should be invalid without a rate" do
			mortality_rate = create_mortality_rate(taxa: nil)
			expect(mortality_rate.valid?).to be false
		end
  end

  private
  	# Default settings to test.
		# Only valid fields.
		def create_mortality_rate(options={})
			MortalityRate.create({
				regiao: 'Norte',
				nome: 'Manaus',
				taxa: '10,5'
			}.merge(options))
		end
end
