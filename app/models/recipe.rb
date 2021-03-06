class Recipe < ActiveRecord::Base
has_many :comments, :dependent => :destroy
  acts_as_taggable_on :tags
  
  ActsAsTaggableOn::TagList.delimiter = " "
  has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/zdjecia/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/zdjecia/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  def self.search(search, page)
 paginate :per_page => 5, :page => page,
           :conditions => ['nazwa like ?', "%#{search}%"],
           :order => 'nazwa'
  end
  
  ajaxful_rateable :stars => 5, :allow_update => false
  ajaxful_rateable :dimensions => [:nazwa]

end
