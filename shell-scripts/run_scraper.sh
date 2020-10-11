#!/bin/bash

# Get update from upstream
cd /home/pi/Documents/scraper/
git pull upstream master --commit --no-edit

# Commit update
git add .
git commit -m "Update from Crinibus/scraper"

# Run python-script
cd /home/pi/Documents/scraper/tech_scraper/
python3 scrape_links.py

# Commit change in logfile.log
git add logfile.log
git commit -m "Daily update logfile.log"

# Commit change in records.json
git add records.json
git commit -m "Daily update records.json"

# Push to origin
git push origin master
