class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :post_id  #post db의 정보 읽어옴. (그전에 모델에서 설정 해줘야함.)
      t.timestamps null: false
    end
  end
end
