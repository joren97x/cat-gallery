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
git add .

rem Commit the changes with a message
git commit -m "New Deployment"

rem Add the 'gh-pages' branch (create it if it doesn't exist)
git branch gh-pages

rem Switch to the 'gh-pages' branch
git checkout gh-pages

rem Push the 'dist' directory to the 'gh-pages' branch of your GitHub repository
git push -f https://github.com/joren97x/cat-gallery.git gh-pages

rem Move back to the original directory
cd ..