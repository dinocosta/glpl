# GLPL: Gitlab Pipelines

[![Gem Version](https://badge.fury.io/rb/glpl.svg)](https://badge.fury.io/rb/glpl)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/b88745d71e95457d992e36ef08dbaef4)](https://app.codacy.com/app/joaofcosta/glpl?utm_source=github.com&utm_medium=referral&utm_content=joaofcosta/glpl&utm_campaign=Badge_Grade_Dashboard)
[![CircleCI](https://circleci.com/gh/joaofcosta/glpl/tree/master.svg?style=svg)](https://circleci.com/gh/joaofcosta/glpl/tree/master)

GLPL is a tool to display and manipulate Gitlab pipelines from your command line.

## Setup

What follows is a list of steps to help you get the command line tool up and running.

1. First off you'll need a Gitlab API Token. To create one go to [Gitlab: Creating A Personal Token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#creating-a-personal-access-token).

	Once you have your access token expose it on a environment variable name `GITLAB_PRIVATE_TOKEN` by doing:

	```
	export GITLAB_PRIVATE_TOKEN="[PRIVATE_TOKEN]"
	```

2. In order for `GLPL` to check your project's pipelines it needs to know the project's id.

	Look at [this example](https://i.imgur.com/R6zQ1Es.png) to find your project ID and then export an environment variable named `GLPL_PROJECT_IDS` with the following pattern:

	```
	export GLPL_PROJECT_IDS="[PROJECT1_NAME]:[PROJECT1_ID],[PROJECT2_NAME]:[PROJECT2_ID],..."
	```

	Example:

	```
	export GLPL_PROJECT_IDS="glpl:8283313,migration:4467622"
	```

## Usage

Here are the commands you need to run in order to execute multiple functions using `glpl`.

* Listing project pipelines

	```
	glpl [PROJECT_NAME]
	```

* Listing pipeline jobs

	```
	glpl [PROJECT_NAME] -p [PIPELINE_ID]
	```
