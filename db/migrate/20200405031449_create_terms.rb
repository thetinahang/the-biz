class CreateTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :terms do |t|
      t.string :name
      t.belongs_to :query, null: false, foreign_key: true

      t.timestamps
    end
  end
end
