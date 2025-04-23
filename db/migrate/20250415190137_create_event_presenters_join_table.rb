class CreateEventPresentersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :event_presenters do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
