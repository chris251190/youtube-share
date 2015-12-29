# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

videos = Video.create([{ title: "Video 1", url: "https://www.youtube.com/watch?v=R8MWKsheHxk", text: "Text 1"},
					   { title: "Video 2", url: "https://www.youtube.com/watch?v=uO7kCUjUaUE", text: "Text 2"},
					   { title: "Video 3", url: "https://www.youtube.com/watch?v=KTYD_kN7rPg", text: "Text 3"}])
