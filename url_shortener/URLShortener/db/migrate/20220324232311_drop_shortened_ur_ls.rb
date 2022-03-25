class DropShortenedUrLs < ActiveRecord::Migration[5.2]
  def change
    drop_table :shortened_ur_ls
  end
end
