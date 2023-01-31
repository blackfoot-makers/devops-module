## Projects presentation

### [Front](MyProj-Frontend):

Local Run => `yarn start`

React project, it display all the cats you have stored in the Backend with a fetch on a setInterval</br>
you can start a local version with `yarn start`</br>
[App.js](MyProj-Frontend/src/App.js) is where the main logic is stored and the only file you should have to change to extend the project

### [Back](MyProj-Backend):

Local Run => `docker-compose -f docker-compose.yml -f docker-compose.local.yml up`

Node Project that setup a Express REST API</br>
We can create new cats and query them with this api</br>
[database.ts](MyProj-Backend/src/database/database.ts) Is where the mongo connection and schemas are declared, and the **environement variables are used**.

## Continuous deployment and integration

### Front

We build an image build for each branch we want a dockerfile

[dev.Dockerfile](MyProj-Frontend/dev.Dockerfile) we use `yarn start` to have live reload and dev environement
The file are localy binded with docker so we can modify them directly

[master.Dockerfile](MyProj-Frontend/master.Dockerfile) copy the project builded version inside the image and serve the site with nginx

[docker-compose.yml](MyProj-Frontend/docker-compose.yml) we use `${}` to escape env variables CI_COMMIT_REF_NAME is provided by gitlab an represent the branch name and CI_HOST that we use to define the host for our service
We provide env **PORT** to for `yarn start` to be on port 80
and **REACT_APP_API_HOST** for the host the rest api is located at

### Back

Same as front we build an image build for each branch we want a dockerfile

[dev.Dockerfile](MyProj-Backend/dev.Dockerfile) We setup node and start the server from nodaemon a live-reload for node
The file are localy binded with docker so we can modify them directly

[master.Dockerfile](MyProj-Backend/master.Dockerfile)
We copy the project file to the image and launch the node server

[docker-compose.yml](MyProj-Backend/docker-compose.yml) we use `${}` to escape env variables CI_HOST that we use to define the host for our service
we also extend this docker-compose with [docker-compose.local.yml](MyProj-Backend/docker-compose.local.yml) and [docker-compose.prod.yml](MyProj-Backend/docker-compose.prod.yml) they give aditional arguments to our deployements.</br>
`.prod` adds the labels to our service so it can be deployed by a orchestrator and is registered by traefik
`.local` build localy the image and adds the ports of mongo and Redis making debug easier



Project description: The goal of the project is to set up a “real world” project, showcasing what we saw during the lecture and workshops.
You'll also demonstrate how Developers interact with your project, and how your infrastructure accommodates them.

You should have :
- A Project fully wrapped with Docker
- Different environment for Dev and Production
- A CI testing and Building the application
- Caching and Usage of S3 to scale your application

The results will be : 
A strong application
- Tested all along the development
- Version and History of you project with the docker images
- Builded and release when you commit new code
- Planned to be scaled with caching and storage services built-in to your application.

Mandatory Rules
- You must be able to explain everything that went into your project
- All of the custom images should be yours
- Your project should be pushed on a Git repository, and accessible by the two teachers 
- You project should be ready and pushed on the repository at least 3 days before the project review
- You project needs to meet the requirements and rules described in the course (Google slides)
- When we try to start your project, it should work on the first try and with one command, no debugging or pre-setup will be done during the review.


