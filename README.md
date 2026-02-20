# EZCD Demo Project

This repo is used to demonstrate how to EZCD with Github Actions (https://github.com/ezcdlabs/ezcd)

There are three demo workflows:
- 1-commit-stage.yml
- 2-acceptance-stage.yml
- 3-deploy.yml

(Currently disabled) And there is one additional workflow just to add to the demo:
- random_commits.yml

The commit stage runs on every push to this repo, it is where a project would normally run unit tests and create a release candidate.

The acceptance stage is triggered by the completion of the commit stage, but it cannot run in parallel with itself - in a real project there would be an acceptance environment that can only have one release candidate being tested at a time.

The acceptance stage workflow will initially ask EZCD for the hash of the commit that is currently top of the queue. This is the *most recently* authored commit that has *passed* the commit stage. This means that the acceptance phase "jumps" ahead to catch up with the backlog of release candidates.

The deploy workflow is only triggered by manual action (workflow_dispatch), where the user must provide the commit hash to deploy.
