#!/bin/bash

# Get update from upstream (changes in code)
cd /home/pi/Documents/scraper/
git pull upstream master --commit --no-edit

# Run python-scripts
python3 main.py -s --threads
python3 scrape_on_hold_products.py

# Commit change in logfile.log and records.json
git add scraper/logfile.log
git add scraper/records.json
git commit -m "Daily update logs and records"

# Push to origin
git push origin master
