class CreateSnippets < ActiveRecord::Migration

  def up
    unless ::Refinery::Snippets::Snippet.table_exists?
      create_table ::Refinery::Snippets::Snippet.table_name do |t|
        t.string :title, :limit => 36, :null => false
        t.text :body
        t.integer :position, :null => false, :default => 0
        t.timestamps
      end
    end

    Refinery::Snippets::Engine.load_seed
  end

  def down
    ::Refinery::UserPlugin.destroy_all({:name => "snippets"})

    drop_table ::Refinery::Snippets::Snippet.table_name
  end

end
