# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(username: 'Bob')
User.create!(username: 'Cindy')
User.create!(username: 'Patrick')
User.create!(username: 'Mo')
User.create!(username: 'Julian')


Artwork.create!(title: 'Mona Lisa', image_url: 'art.com/mona', artist_id: 1)
Artwork.create!(title: 'Doodle', image_url: 'art.com/doodle', artist_id: 3)
Artwork.create!(title: 'Squares', image_url: 'art.com/squares', artist_id: 5)


ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
ArtworkShare.create!(artwork_id: 1, viewer_id: 3)
ArtworkShare.create!(artwork_id: 1, viewer_id: 5)

ArtworkShare.create!(artwork_id: 2, viewer_id: 1)
ArtworkShare.create!(artwork_id: 2, viewer_id: 5)

ArtworkShare.create!(artwork_id: 3, viewer_id: 2)
ArtworkShare.create!(artwork_id: 3, viewer_id: 5)
ArtworkShare.create!(artwork_id: 3, viewer_id: 1)

Comment.create!(author_id: 3, artwork_id: 1, body: "Fake!")
Comment.create!(author_id: 2, artwork_id: 1, body: "How much?")
Comment.create!(author_id: 2, artwork_id: 3, body: "Cool!")
Comment.create!(author_id: 1, artwork_id: 3, body: "Awesome!")