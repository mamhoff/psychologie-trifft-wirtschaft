# frozen_string_literal: true
# This migration comes from alchemy (originally 20200423073425)

class CreateAlchemyEssenceNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :alchemy_essence_nodes, id: :bigint do |t|
      t.references "node", type: :integer
      t.timestamps
    end
    add_foreign_key "alchemy_essence_nodes", "alchemy_nodes", column: "node_id"
  end
end
