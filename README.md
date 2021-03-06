# README

This is a Ruby on Rails application that uses the Last FM API to get results based on search terms. 

## Installation instructions
To load this app, git clone, run "bundle install", "rake db:migrate", and then "rails s" to start the server. Go to http://localhost:3000 in your favorite browser. You can start by creating a query and providing a name for the query. The query terms can be included at this time but you will be able to go back and edit accordingly. Hope you enjoy using this application!

## Further Execution Instructions
- This application requires Ruby version 2.7.1 so please make sure you have that installed beforehand.
- This will also require Rails version 6.0.2 or higher. Please install that as well. 
- Run 'gem install bundler'. It is necessary for the next step.
- This application comes with a Gemfile, providing the necessary gems (libraries) for running this application. Run 'bundle install'. Troubleshoot accordingly if not successful. 
- Run 'gem install rake'.
- Run 'rake db:migrate'.
- Go to the Last FM developer webpage and get an API key.
- Create an .env file in the root directory of this project. 
- Save your API key as the LASTFM_API_KEY variable in this file.
- Run 'rails s' to start the server. 
- Once the server is up and running, go to localhost:3000 in your browser. 
- You should see a page with 'Queries' at the very top. 
- Click on 'New Query.'
- You will see a form -- fill out what you want. 
- Click on the saved query. 
- Click on any of the 'See Results' for the entered search terms. 
- You should see pretty-printed results in the form of JSON. 

## Expected Input
Input should be a selected method from the dropdown menu, a string of text for Artist, and/or a string of text for Track. 

## Expected Output
Pretty-printed JSON based on the query parameters set from input.

# Contributing

When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.

Please note we have a code of conduct, please follow it in all your interactions with the project.

## Pull Request Process

Ensure any install or build dependencies are removed before the end of the layer when doing a build.
Update the README.md with details of changes to the interface, this includes new environment variables, exposed ports, useful file locations and container parameters.
Increase the version numbers in any examples files and the README.md to the new version that this Pull Request would represent. 
You may merge the Pull Request in once you have the sign-off of the main developer.

# Code of Conduct

## Our Pledge

In the interest of fostering an open and welcoming environment, we as contributors and maintainers pledge to making participation in our project and our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

## Our Standards

Examples of behavior that contributes to creating a positive environment include:

- Using welcoming and inclusive language
- Being respectful of differing viewpoints and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members
- Examples of unacceptable behavior by participants include:

- The use of sexualized language or imagery and unwelcome sexual attention or advances
- Trolling, insulting/derogatory comments, and personal or political attacks
- Public or private harassment
- Publishing others' private information, such as a physical or electronic address, without explicit permission
- Other conduct which could reasonably be considered inappropriate in a professional setting

## Our Responsibilities

Project maintainers are responsible for clarifying the standards of acceptable behavior and are expected to take appropriate and fair corrective action in response to any instances of unacceptable behavior.

Project maintainers have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct, or to ban temporarily or permanently any contributor for other behaviors that they deem inappropriate, threatening, offensive, or harmful.

## Scope

This Code of Conduct applies both within project spaces and in public spaces when an individual is representing the project or its community. Examples of representing a project or community include using an official project e-mail address, posting via an official social media account, or acting as an appointed representative at an online or offline event. Representation of a project may be further defined and clarified by project maintainers.

## Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting the project team at thetinahang@gmail.com. All complaints will be reviewed and investigated and will result in a response that is deemed necessary and appropriate to the circumstances. The project team is obligated to maintain confidentiality with regard to the reporter of an incident. Further details of specific enforcement policies may be posted separately.

Project maintainers who do not follow or enforce the Code of Conduct in good faith may face temporary or permanent repercussions as determined by other members of the project's leadership.

## Attribution

This Code of Conduct is adapted from the Contributor Covenant, version 1.4, available at http://contributor-covenant.org/version/1/4
