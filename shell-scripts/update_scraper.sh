#!/bin/bash

# Get update from upstream (changes in code)
cd /home/pi/Documents/scraper/
git pull upstream master --commit --no-edit

# Commit changes
git add .
git commit -m "Update from Crinibus/scraper"

# Push updates from Crinibus/scraper to origin
#git push origin master


# Get updates from origin (new links and stuff)
git pull origin master --commit --no-edit

# Commit changes
git add .
git commit -m "Update from Raspi"

# Push updates to origin
git push origin master
