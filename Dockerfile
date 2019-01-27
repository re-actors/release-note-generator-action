FROM openjdk:8-alpine
LABEL "maintainer"="Marco Mornati <marco@mornati.net>"
LABEL "com.github.actions.name"="Release Notes Generator"
LABEL "com.github.actions.description"="Create a release notes of milestone"
LABEL "com.github.actions.icon"="pocket"
LABEL "com.github.actions.color"="blue"

ENV RELEASE_NOTE_GENERATOR_VERSION="v0.0.2" \
    ORG_NAME=${ORG_NAME:-"myorg"} \
    REPOSITORY=${REPOSITORY:-"myrepo"} \
    MILESTONE_ID=${MILESTONE_ID:-"1"} \
    TARGET_FILE=${TARGET_FILE:-"release_notes.md"}

COPY entrypoint.sh /

ENTRYPOINT ["sh", "/entrypoint.sh"]