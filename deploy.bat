@echo off

rem Exit on error
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"

rem Build the Vue.js app
npm run build

rem Navigate to the 'dist' directory
cd dist

rem Initialize a new Git repository
git init

rem Add all files to the repository
git add -A

rem Commit the changes with a message
git commit -m "New Deployment"

rem Push the 'dist' directory to the 'gh-pages' branch of your GitHub repository
git push -f https://github.com/joren97x/cat-gallery.git master:gh-pages

rem Move back to the original directory
cd ..
