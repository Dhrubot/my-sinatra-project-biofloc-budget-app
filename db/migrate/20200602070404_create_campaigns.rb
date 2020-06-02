class CreateCampaigns < ActiveRecord::Migration[6.0]

  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.integer :goal_amount
      t.integer :organizer_id
    end
  end

end
