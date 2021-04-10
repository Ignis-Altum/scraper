#!/bin/bash

# Get update from upstream (changes in code)
cd /home/pi/Documents/scraper/
git pull upstream master --commit --no-edit

# Run python-script
python3 main.py -s

# Commit change in logfile.log and records.json
git add scraper/logfile.log
git add scraper/records.json
git commit -m "Daily update logs and records"

# Commit change in records.json
# git add records.json
# git commit -m "Daily update records.json"

# Push to origin
git push origin master
