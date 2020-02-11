wiki_titles = [
  {title: 'History of Science'},
  {title: 'History of Literature'},
  {title: 'History of Art'}
]
wiki_titles.each { |title| Title.create(title) }
