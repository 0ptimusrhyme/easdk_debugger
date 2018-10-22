class CreateInstalls < ActiveRecord::Migration[5.2]
  def change
    create_table :installs do |t|
      t.string :access_token
      t.string :myshopify_url
    end
  end
end
