## Technical Exerices

1. Clone the Repo
2. ex1 run elm-reactor or elm-make Main.elm
3. ex2 open index.html in browser

>4. Because the provided api didn't return CORS headers I couldn't test it from my Localhost
so I scraped the data from the api and used json-server to serve json locally.
I also removed alot of the unused fields from the json as they wouldn't be used for the task.
To set up the api locally:
npm install -g json-server
json-server --watch db.json
To run the application, you can elm-make Main.elm or run elm-reactor.
