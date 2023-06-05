class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports, id: :uuid do |t|
      t.string :name, null: false
      t.string :description
      t.string :status
      t.uuid :organization_id, null: false
      t.uuid :user_id, null: false
      t.uuid :portfolio_id, null: false
      t.timestamps
    end
  end
end
