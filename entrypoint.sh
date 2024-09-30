#!/bin/sh -l

REPO_URL=$1
MANIFEST_PATH=$2
IMAGE_TAG=$3
USERNAME=$4
EMAIL=$5

# Clone the ArgoCD manifests repository
git config --global user.name "${USERNAME}"
git config --global user.email "${EMAIL}"
git clone "${REPO_URL}" manifests-repo
cd manifests-repo || exit 1

# Replace the image tag
sed -i "s|newTag|${IMAGE_TAG}|g" "${MANIFEST_PATH}"

# Commit and push the changes
git commit -am "Update image tag to ${IMAGE_TAG}"
git push

