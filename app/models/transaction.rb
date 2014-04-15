# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  paid        :boolean
#  amount      :integer
#  currency    :string(255)
#  refunded    :boolean
#  customer_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  state       :string(255)
#

class Transaction < ActiveRecord::Base
  belongs_to :customer
  default_scope ->{order :created_at}
  scope :successful, -> { where("state =?", "successful")}
  scope :failed, -> { where("state =?", "failed")}
  scope :disputed, -> { where("state =?", "disputed")}
end
