#!/urs/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'New Deployment'
git push -f https://github.com/joren97x/cat-gallery.git master

cd -