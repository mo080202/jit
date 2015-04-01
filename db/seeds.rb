# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
entry1 = Termlist.create(course_id: '1', term_id: '8')
entry2 = Termlist.create(course_id: '1', term_id: '9')
entry3 = Termlist.create(course_id: '2', term_id: '8')
