# release-note-generator-action
GitHub Action to create a release notes using the Spring.io release notes generator script.

## What is this for?
This script is intended to help you to aumates the release notes for your project. It is generated based on the Spring.io release notes generator script: [https://github.com/spring-io/github-release-notes-generator](https://github.com/spring-io/github-release-notes-generator)

And it is creating a relase notes like the one you can, for example, find on the Spring-Boot project: https://github.com/spring-io/github-release-notes-generator

![Release Notes Example](https://res.cloudinary.com/blog-mornati-net/image/upload/v1548586836/Capture_d_e%CC%81cran_2019-01-27_a%CC%80_12.00.09_enuuwq.png)

## How can I use it?
The script is using environment variables and secrets to connect to GitHub and retrieve the necessary informaation for the release notes generation.

* **RELEASE_NOTE_GENERATOR_VERSION**: Version of the script to use. By default is configured to use v0.0.2 (right now the latest one).
* **ORG_NAME**: organization name owning the project you want to generate release notes for
* **REPOSITORY**: your project name.
* **MILESTONE_ID**: the milestone id. It should retrieved directly by the GitHub action flow (in progress)
* **TARGET_FILE**: target markdown file in which you want to create the release notes. By default *release_notes.md*. You can link to the action to upload it to your GitHub repo (release creation? wiki page? or whatever you want)

## Sample usage workflow configuration

```
workflow "New workflow" {
  on = "push"
  resolves = ["Release Notes Generator"]
}

action "Release Notes Generator" {
  uses = "./"
  secrets = ["GITHUB_TOKEN"]
  env = {
    ORG_NAME = "mmornati"
    REPOSITORY = "docker-ghostblog"
    MILESTONE_ID = "1"
  }
}
```

![Release Notes Screen](https://res.cloudinary.com/blog-mornati-net/image/upload/v1548587321/Capture_d_e%CC%81cran_2019-01-27_a%CC%80_12.08.31_m8eoop.png)

