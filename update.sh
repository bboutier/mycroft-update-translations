#!/bin/bash
set -e

cd /home/pi/mycroft-update-translations

# For update of skill
for folder in $(ls -1 /opt/mycroft/skills)
do 
  echo "Folder $folder"
  cd /opt/mycroft/skills/$folder
  git reset --hard HEAD
  git clean -f -d
  git pull
  cd -
done

# Apply again translation
cd /home/pi/mycroft-update-translations
./mycroft-update-translations.py
