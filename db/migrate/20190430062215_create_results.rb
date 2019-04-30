class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|

      t.string :call_id
      t.string :lead_id
      t.string :lead_type
      t.string :agent_name
      t.string :creation_date
      t.string :finish_date
      t.string :result
      t.string :comment
      t.string :app_number

      t.timestamps
    end
  end
end
