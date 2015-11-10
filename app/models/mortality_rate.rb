class MortalityRate < ActiveRecord::Base
     validates :regiao, presence: true
     validates :nome, presence: true
     validates :taxa, presence: true
end
