class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.integer :age
      t.text :backstory
      t.string :video_url

      t.integer :votes_count, default: 0

      t.timestamps
    end
  end
end
