ActiveRecord::Schema.define(:version => 0) do
  create_table :product, :force => true do |t|
    t.string :name
    t.timestamps
  end
	create_table :people, :force => true do |t|
		t.string :name
		t.timestamps
  end
end
