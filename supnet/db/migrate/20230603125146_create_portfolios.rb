class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios, id: :uuid do |t|
      t.uuid :organization_id, null: false
      t.uuid :user_id, null: false
      t.integer :version
      t.string :name
      t.string :description
      t.string :status
      t.timestamps
    end
  end
end
