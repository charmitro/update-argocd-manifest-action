#!/bin/sh -l

REPO_URL=$1
REPO_BRANCH=$2
MANIFEST_PATH=$3
IMAGE_TAG=$4
USERNAME=$5
EMAIL=$6

# Clone the ArgoCD manifests repository
git config --global user.name "${USERNAME}"
git config --global user.email "${EMAIL}"
git clone --branch "${REPO_BRANCH}" "${REPO_URL}" manifests-repo
cd manifests-repo || exit 1

# Replace the image tag
sed -i "s|newTag|${IMAGE_TAG}|g" "${MANIFEST_PATH}"

# Commit and push the changes
git commit -am "Update image tag to ${IMAGE_TAG}"
git push origin "${REPO_BRANCH}"

