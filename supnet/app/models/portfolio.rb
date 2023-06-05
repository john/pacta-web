class Portfolio < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :reports
  has_one_attached :uploaded_file

  validates_presence_of :status, :name, :description

  # These could be replaced with an enumumeration for efficiency, though that's
  # most likely PO
  scope :active, -> { where("status = 'Active'")}
  scope :inactive, -> { where("status = 'Inactive'")}
  scope :running, -> { where("status = 'Running'")}

  # scope :belongs_to, ->(user) { where("user_id =", user.id)}

  # scope :default_permissions_for, lambda{|user| { :conditions => { :user_id => user.id, :is_default => true } }

end