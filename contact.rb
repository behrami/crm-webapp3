gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact<ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    return "#{first_name} #{last_name}"
  end

  def email_address
    return "#{email}"
  end

  def note_display
    return "#{note}"
  end

end

Contact.auto_upgrade!

at_exit do
  ActiveRecord::Base.connection.close
end
