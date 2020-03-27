DB = Sequel.connect('sqlite://development.db')

module Models
  class Movie < Sequel::Model
    def to_hash
      {
        name: name,
        description: description,
        image_url: image_url,
        days_presented: days_presented
      }
    end
  end
end
