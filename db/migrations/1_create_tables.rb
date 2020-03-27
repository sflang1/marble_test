Sequel.migration do
  change do
    create_table :movies do
      primary_key :id
      String      :name, null: false
      String      :description, null: false
      String      :image_url, null: false
      String      :days_presented, null: false
    end

    create_table :reservations do
      primary_key  :id
      Fixnum       :movie_id
      DateTime     :date
    end
  end
end