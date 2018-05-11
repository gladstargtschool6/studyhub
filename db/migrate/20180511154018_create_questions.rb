class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.string :category
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true
      t.belongs_to :answer, index: true

      t.timestamps
    end
  end
end
