class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :msg, type: String

  belongs_to :article
  belongs_to :user

  belongs_to :comment, :class_name => 'Comment', :inverse_of => :replies
  has_many :replies, :class_name => 'Comment', :inverse_of => :comment


  def delete_allowed? current_user
  	current_user == user and replies.blank?
  end
end
