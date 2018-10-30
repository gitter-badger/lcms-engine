# frozen_string_literal: true

class CreateStandardEmphasis < ActiveRecord::Migration[4.2]
  def change
    create_table :standard_emphases do |t|
      t.references :standard, null: false, index: true, foreign_key: true
      t.string     :emphasis, null: false
      t.string     :grade
    end
  end
end