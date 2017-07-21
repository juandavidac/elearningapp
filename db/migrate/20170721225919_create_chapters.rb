class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.integer :course_id
      t.string :name
      t.string :description
      t.string :video_url
      t.boolean :completed, default: "false"

      t.timestamps
    end

    add_index :chapters, :created_at
  end
end
