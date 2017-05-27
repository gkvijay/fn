#!/bin/bash
set -ex

user="treeder"
service="functions"
tag="latest"
version_file="api/version/version.go"

if [ -z $(grep -m1 -Eo "[0-9]+\.[0-9]+\.[0-9]+" $version_file) ]; then
  echo "did not find semantic version in $version_file"
  exit 1
fi
perl -i -pe 's/\d+\.\d+\.\K(\d+)/$1+1/e' $version_file
version=$(grep -m1 -Eo "[0-9]+\.[0-9]+\.[0-9]+" $version_file)
echo "Version: $version"

make docker-build

git add -u
git commit -m "$service: $version release [skip ci]"
git tag -f -a "$version" -m "version $version"
git push
git push origin $version

# TODO: Where to push these?
# Finally tag and push docker images
# docker tag $user/$service:$tag $user/$service:$version
# docker push $user/$service:$version
# docker push $user/$service:$tag

cd fn
./release.sh $version
cd ..
