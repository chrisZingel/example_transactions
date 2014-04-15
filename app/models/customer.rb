# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#


class Customer < ActiveRecord::Base
  has_many :transactions
end
