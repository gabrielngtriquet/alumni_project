class AddWhatsappToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :whatsapp, :string
  end
end
