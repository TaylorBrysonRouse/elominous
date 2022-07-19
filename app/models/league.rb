class League < ApplicationRecord
  belongs_to :sport
  belongs_to :customer, class_name: "Customer", foreign_key: 'customer_id'
end