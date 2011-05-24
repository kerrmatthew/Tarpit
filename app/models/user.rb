class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :name, :role
  attr_accessor :login
  
  has_and_belongs_to_many :collections
  has_many :download_counters, :dependent => :destroy
  
  ROLES = %w[normal admin]
  
  scope :admin, where(:role => "admin")
  scope :normal, where(:role => "normal")
  
   protected

 def self.find_for_database_authentication(conditions)
   login = conditions.delete(:login)
   where(conditions).where(["name = :value OR email = :value", { :value => login }]).first
 end


 # Attempt to find a user by it's email. If a record is found, send new
 # password instructions to it. If not user is found, returns a new user
 # with an email not found error.
 def self.send_reset_password_instructions(attributes={})
   recoverable = find_recoverable_or_initialize_with_errors([:login], attributes, :not_found)
   recoverable.send_reset_password_instructions if recoverable.persisted?
   recoverable
 end 

 def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
   [:login, :email].each { |k| attributes[k].try(:downcase!) }

   attributes = attributes.slice(*required_attributes)
   attributes.delete_if { |key, value| value.blank? }

   if attributes.size == required_attributes.size
     if attributes.has_key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
     else  
       record = where(attributes).first
     end  
   end  

   unless record
     record = new

     required_attributes.each do |key|
       value = attributes[key]
       record.send("#{key}=", value)
       record.errors.add(key, value.present? ? error : :blank)
     end  
   end  
   record
 end

 def self.find_record(login)
   #where(attributes).where(["username = :value OR email = :value", { :value => login }]).first if attributes
   where(["name = :value OR email = :value", { :value => login }]).first 
 end


end
