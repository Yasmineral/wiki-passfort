wiki_titles = [
  {title: 'history of science'},
  {title: 'history of literature'},
  {title: 'history of art'}
]
wiki_titles.each { |title| Title.create(title) }


