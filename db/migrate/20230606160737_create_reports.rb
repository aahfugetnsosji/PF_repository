class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|

      t.integer :reason,     null: false
      t.text    :body,       null: false
      t.boolean :is_handled, null: false, default: "FALSE"
      t.integer :post_id,    null: false

      t.timestamps
    end
  end
end
