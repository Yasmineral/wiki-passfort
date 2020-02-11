wiki_titles = [
  {title: 'history of science'},
  {title: 'history of literature'},
  {title: 'history of art'}
]
wiki_titles.each { |title| Title.create(title) }

revisions = [
  {content: "Science is really cool and interesting", title_id: 16},
  {content: "Lierature is really cool and interesting", title_id: 17 },
  {content: "Art is really cool and interesting", title_id: 18}
]

revisions.each { |revision| Revision.create(revision) }