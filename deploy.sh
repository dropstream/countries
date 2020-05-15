#!/bin/bash
set -e
VERSION=$(cat VERSION)

echo ":github: Bearer ${GITHUB_TOKEN}" >> ~/.gem/credentials
chmod 0600 ~/.gem/credentials
gem build beagle_service.gemspec
echo "Build completed"
gem push --key github --host https://rubygems.pkg.github.com/dropstream "beagle_service-${VERSION}.gem"

echo "Deployment complete for version $(cat VERSION)"
