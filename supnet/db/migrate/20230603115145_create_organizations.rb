class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations, id: :uuid do |t|
      t.string :name, null: false
      t.string :description
      t.string :status

      t.timestamps
    end

    # Create initial org
    Organization.new({ name: "Acme Financial", status: "Active"}).save
  end
end
