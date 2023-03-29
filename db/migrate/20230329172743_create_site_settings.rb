class CreateSiteSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :site_settings do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
