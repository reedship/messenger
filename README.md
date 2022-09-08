# README
## TODO
	1. Limit messages from a conversation to the most recent 100 sorted by newest, and with a "created_at" within 30 days
	2. Create a route to get all messages from all conversations with same rules applied
	3. Document routes (swagger and readme)
	4. write tests for all routes and include how to run tests in readme (i want to use vcr to record the results and test off that)
	5. create dockerfile and documentation on how to run
	6. create postman collection of all endpoints

## Installation
  * Install git to your machine
	* https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
  * Clone this directory to your machine
	* `git clone https://github.com/reedship/PUTGITHUBLOCATIONHERE messages_api`
  * Navigate to the project directory
	* `cd messages_api`


## Running the API
In order to run this API, you will need to either have docker installed on your system to run the API as a container (preferred) or install compatible versions of ruby (3.0.4) and rails (7.0.3.1) in order to run the API from your local shell. This is a matter of user preference however the Docker solution will be

### Docker
  * Install docker to your system
	* You can find the installation instructions at https://docs.docker.com/get-docker/
  * Run `docker run .` inside the project directory
	* Docker will find the the `Dockerfile` in the project root and build based on the instructions within
  * Send all requests to the now exposed `localhost:8080` TODO: PUTACTUALPORTHERE

### Rails
  * Ensure you have Ruby Version `3.0.4` and Rails `7.0.3.1` installed (or compatible versions)
	* For installation, see the following documentation: https://www.ruby-lang.org/en/documentation/installation/
  * Inside the project directory, run the following commands in order
	```
	rails db:setup
	rails db:migrate
	rails server
	```


## Routing
I have listed the available routes below. For information on what each route expects, please see the swagger page for this api. (TODO: CREATE SWAGGER)

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
CREATE CONVERSATION:
	POST /conversations
CREATE MESSAGE IN CONVERSATION:
	POST /conversations/{conversation_id}/messages
```
