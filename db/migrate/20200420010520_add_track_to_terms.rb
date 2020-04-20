class AddTrackToTerms < ActiveRecord::Migration[6.0]
  def change
  	add_column :terms, :track, :string
  end
end
