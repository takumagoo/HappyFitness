class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|

      # ジャンルID
      t.integer :genre_id
      # メニュー名
      t.string :name
      # 説明
      t.string :explanation

      t.timestamps
    end
  end
end
