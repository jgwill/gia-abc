#!/bin/bash

# This bash script will bump the version in setup.py similar to npm version patch

# Get the current version
version=$(grep -Eo "[0-9]+\.[0-9]+\.[0-9]+" setup.py)

# Split the version into an array
IFS='.' read -r -a version_array <<< "$version"

# Increment the patch version
version_array[2]=$((version_array[2] + 1))

# Join the array back into a string
new_version="${version_array[0]}.${version_array[1]}.${version_array[2]}"

# Replace the old version with the new version in setup.py
sed -i "s/$version/$new_version/g" setup.py

echo "Version bumped to $new_version"