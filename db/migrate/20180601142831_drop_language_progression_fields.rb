# frozen_string_literal: true

class DropLanguageProgressionFields < ActiveRecord::Migration[4.2]
  def change
    remove_column :standards, :language_progression_file, :string
    remove_column :standards, :language_progression_note, :string
    remove_column :standards, :is_language_progression_standard, :boolean, null: false, default: false
  end
end