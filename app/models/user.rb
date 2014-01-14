class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :Owner
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,:id
  has_many :accounts 
  # attr_accessible :title, :body
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => true
  
  after_create :default_role
  private
  def default_role
    self.roles << Role.where(:name => 'Accountant').first
  end
end
