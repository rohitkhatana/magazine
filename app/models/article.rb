class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String

  belongs_to :author, inverse_of: :author_of, class_name: 'User'


  def glance
  	title + " (#{body[0..10]}.....)"
  end

end
