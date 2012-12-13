class ChangeEbookColumnNameLinkToEbookFile < ActiveRecord::Migration
  def change
    rename_column :ebooks, :link, :ebook_file
  end
end
