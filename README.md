# README

## Installation
  * Install git to your machine
	* https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
  * Clone this directory to your machine
	* `git clone https://github.com/reedship/PUTGITHUBLOCATIONHERE messages_api`
  * Navigate to the project directory
	* `cd messages_api`


## Running the API
In order to run this API, you will need to have rails 7 and ruby 3.0.4 installed. I tried to create a Docker solution for running the project but ran into some very strange issue building the gem dependecies, which I believe were based on the M1 Chip architecture. I decided against diving too deep into this due to the time constraint.

### Rails
  * Ensure you have Ruby Version `3.0.4` and Rails `7.0.3.1` installed (or compatible versions).
	* For installation, see the following documentation: https://www.ruby-lang.org/en/documentation/installation/ .
	* I recommend using [rbenv](https://github.com/rbenv/rbenv) for managing multiple ruby versions, should you have a different version currently installed.
  * Inside the project directory, run the following commands in order.
	```
	bundle install
	rails db:setup
	rails db:migrate
	rails server
	```
  * In your shell you should see the following printed:
	```
	=> Booting Puma
	=> Rails 7.0.3.1 application starting in development
	=> Run `bin/rails server --help` for more startup options
	Puma starting in single mode...
	* Puma version: 5.6.5 (ruby 3.0.4-p208) ("Birdie's Version")
	*  Min threads: 5
	*  Max threads: 5
	*  Environment: development
	*          PID: 65343
	* Listening on http://127.0.0.1:3000
	* Listening on http://[::1]:3000
	Use Ctrl-C to stop
    ```

## Testing
For testing the APIs I would have love to write some unit tests, but with the timeline of the project and the priority I placed on documentation, I ran out of time. However, the postman collection contains the ability to manually test each route for intended results. This is by no means my preference, but I didn't want to spend an overly large amount of time and break the spirit of the project by being dishonest about how much time I spent on it. If I had more time I would prefer to use VCR to create automatically updating caches of each controller methods return value (to reduce the time the test suite would take to run) and test against them. I've had a lot of positive experience using this method rather than the default integration/controller tests that Rails come with.

A good method for running through the postman collection is as follows:
	1. Create at minimum two users
	2. Create a conversation between user_ids `1` and `2`
	3. Post a message in that conversation
	4. Check all `GET` routes for expected results

### Postman
For your convenience I have provided a postman collection of a few basic requests necessary to create users, conversations, and messages within those conversations. You can find it in the root folder at `Messages.postman_collection.json`.
Reference:
  * https://www.postman.com/downloads/
  * https://learning.postman.com/docs/getting-started/importing-and-exporting-data/

## Routing
I have listed the available routes below. For information on what each route expects, please see the `available_routes.html` page.

### User Routes
```
GET ALL USERS:
	GET /users
GET USER:
	GET /users/{user_id}
CREATE USER:
	POST /users
```
### Conversation Routes
```
GET ALL CONVERSATIONS:
	GET /conversations
GET CONVERSATION INFO:
	GET /conversations/{conversation_id}
GET CONVERSATION MESSAGES:
	GET /conversations/{conversation_id}/messages
GET ALL CONVERSATION MESSAGES:
	GET /conversations/all
CREATE CONVERSATION:
	POST /conversations
CREATE MESSAGE IN CONVERSATION:
	POST /conversations/{conversation_id}/messages
```
