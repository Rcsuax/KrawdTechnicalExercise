# Technical Exerices

## Getting started

### Exercise 1
1. run elm-package install -y
2. run elm-reactor or elm-make Main.elm

### Exercise 2
open index.html in your browser

### Exercise 3
This solution is by no means perfect and is abit hacky for a few reasons:
* I couldn't test the API locally because it didn't seem to be configured with CORS.
* The API was inconsistent:
  * It had issues which caused it to return null or " " (empty string).
  * It returned the Player JSON but it was missing fields.
  
To get around these issues I:
1. Wrote a script to GET and sanitize the JSON returned from the API.
2. Used Json-server to deploy a mock API.

To test the Exercise locally you need to:
1. `cd ex3/`
2. `npm install` 
3. `npm install -g json-server`
4. `elm-package install -y`
4. you can either do `npm run fetch` or you can skip to the next step and use the db.json that is already provided.
5. run `json-server --watch db.json`
6. run `elm-reactor` or `elm-make Main.elm`
