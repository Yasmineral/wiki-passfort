# Passfort - wiki tech test

## Requirements 

1. A wiki is a collection of documents
2. Documents are lumps of plain text. No graphics, attachments, or formatting
3. Each document is uniquely identified by a title that is a maximum of 50 characters in
length. This title does not change for the life of a document
4. A document can have multiple revisions, as it is updated over time. We store all historical
revisions of a document
5. We should be able to view the document as it was at any point in time. I.e. we can use
any timestamp to fetch a revision e.g. If we have a document at time 1pm and time 3pm,
then sending a timestamp of 2pm should return the document as it was at time 1pm.
Your task is to implement a JSON api with the following endpoints:

* GET /documents
This should return a list of available titles.
* GET /documents/<title>
This should return a list of available revisions for a document.
* GET /documents/<title>/<timestamp>
This should return the document as it was at that timestamp.
* GET /documents/<title>/latest
This should return the current latest version of the document.
* POST /documents/<title>
This allows users to post a new revision of a document.
It should receive JSON in the form: {content: ‘new content...’}. 

## How to install and run
1. Clone this repository
2. In your command line
* Run `bundle install` to install dependencies
* Run `ruby app.rb` to start up the server

## Using the app
1. Request list of available titles

```
curl http://localhost:4567/documents 
```
![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/documents.png "documents")

![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/documents_200.png "documents200")

![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/documents_400.png "documents400")

2. Resturn list of available revisions for a document

```
curl http://localhost:4567/documents/history-of-science
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

![Alt text](https://github.com/Yasmineral/wiki-passfort/blob/master/screenshots/rubocop.png "rubocop)

## Development

### Key decisions and challenges


### Testing
* To test the controller, I used manual tests via curl and the browser
* I used TDD and unit testing to test the model
