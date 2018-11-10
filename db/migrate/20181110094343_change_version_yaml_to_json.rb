class ChangeVersionYamlToJson < ActiveRecord::Migration[5.1]
  def change
    add_column :versions, :new_object, :jsonb # or :json

    PaperTrail::Version.reset_column_information
    PaperTrail::Version.find_each do |version|
      version.update_column :new_object, YAML.load(version.object) if version.object
    end

    remove_column :versions, :object
    rename_column :versions, :new_object, :object
  end
end
