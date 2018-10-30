# frozen_string_literal: true

class AddTreeToResources < ActiveRecord::Migration[4.2]
  def change
    add_column :resources, :tree, :boolean, default: false, null: false, index: true
  end

  def data
    Resource.where.not(curriculum_tree_id: nil).update_all(tree: true)
  end
end