#!/bin/bash

# Get update from upstream (changes in code)
cd /home/pi/Documents/scraper/
git pull upstream master --commit --no-edit

# Run python-script
cd /home/pi/Documents/scraper/tech_scraper/
python3 scrape_links.py

# Commit change in logfile.log and records.json
git add logfile.log
git add records.json
git commit -m "Daily update logs and records"

# Commit change in records.json
# git add records.json
# git commit -m "Daily update records.json"

# Push to origin
git push origin master
