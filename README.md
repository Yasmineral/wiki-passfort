# Passfort - wiki tech test

## How to install and run
1. Clone this repository
2. In your command line:

```bash
> bundle install
> rake db:create  
> rake db:migrate
```

3. Run `ruby app.rb` to start up the server

## Using the app
1. Request list of available titles

```
curl http://localhost:4567/documents 
```
![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/documents.png "documents")

![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/documents_200.png "documents200")

![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/documents_400.png "documents400")

2. Return list of available revisions for a document

```
curl http://localhost:4567/documents/history-of-literature
```

![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/revisions.png "revisions")

3. Post a new revision of a document

```
curl -d '{"content": "LATEST content"}' -X POST http://localhost:4567/documents/history-of-science
```

![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/post%20_success.png "post")

## Run tests
1. Run `rspec` from command line to check tests. This app currently has 100% coverage.

![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/rspec.png "rspec")

2. Run `rubocop` from command line to check linter.

![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/rubocop.png "rubocop")

## Development

### Key decisions and challenges
I decided to use Sinatra over Rails for this application given it's small size and needing to get up and running in good time. My database set up was set up in Postgres via ActiveRecord as this is what I have the most experience using. I decided to create a table that just listed the titles of each document, and establish a 'has_many' relationship with a revisions table documenting the content of each file across numerous time stamps. Ideally, I wanted to avoid querying both tables in order to retrieve & post revisions as this is not a very streamlined workflow, so given more time I would have liked to explore a way to avoid this. Currently, the content of the file is being returned as a json object so I'd have also liked to create a method that extracts only what I need. Lastly, my controllers have a lot of logic in them which isn't best practice - given more time I would refactor and strip away as much as possible into the models. 


### Testing
* To test the controller, I used manual tests via curl and the browser
* I used TDD and unit testing to test the model
