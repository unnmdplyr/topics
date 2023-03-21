#!/usr/bin/env bash

# Get projects in a gradle project:
# ./gradlew projects --info

# ./gradlew projects --info | grep -E "^(\+|\\\)---\s*Project\s+" | awk '{print $3}'

PROJECTS=(
':project-1'
':project-2'
...
':project-n'
)

# Dependency filtering in a gradle project:

for PROJECT in ${PROJECTS[@]}; do
    echo " >>> $PROJECT"
    DEPENDENCIES=$(./gradlew "$PROJECT:dependencies")
    echo "$DEPENDENCIES" | grep -F "<library-name>"
done


pushd buildSrc > /dev/null
    echo " >>>> buildSrc"
    ../gradlew dependencies | grep -F "<library-name>"
popd > /dev/null
