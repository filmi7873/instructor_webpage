class AddPresenterToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :presenter_id, :integer
  end
end
