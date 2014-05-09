class CreateServiceRequests < ActiveRecord::Migration
  def change
    create_table :service_requests do |t|
      t.string :email, null: false, limit: 100
      t.string :name, limit: 64
      t.text :message, null: false
      t.boolean :read, null: false, default: false
      t.string :address, limit: 100
      t.string :state, limit: 20
      t.string :phone, limit: 11
      t.boolean :day, default: true

      t.timestamps
    end

    add_index :service_requests, :read
    add_index :service_requests, :email
    add_index :service_requests, :name
  end
end
