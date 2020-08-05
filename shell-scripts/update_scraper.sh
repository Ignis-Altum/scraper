#!/bin/bash

# Get update from upstream
cd /home/pi/Documents/scraper/
git pull upstream master --commit --no-edit

# Commit changes
git add .
git commit -m "Update from Crinibus/scraper"

# Push to origin
git push origin master
