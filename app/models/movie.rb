module Models
  class Movie < Sequel::Model
    def to_hash
      {
        id: id,
        name: name,
        description: description,
        image_url: image_url,
        days_presented: days_presented
      }
    end
  end
end
