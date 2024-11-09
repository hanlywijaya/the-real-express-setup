#!/bin/bash

# Function to get current user running the script
current_user=$(whoami)

# Script disclaimer
echo "This script will copy or move system settings and personal files to a new macOS install."
echo "You are running this script as: $current_user"
echo "Press Y to continue..."
read -n 1 -s -r response
if [[ ! $response =~ ^[Yy]$ ]]; then
  echo "Exiting script. Please run the script again if you want to proceed."
  exit 1
fi

# Get old macOS install username
echo "Please enter the username for the previous macOS install:"
read old_username

# Get old macOS drive name
echo "Enter the name of the old macOS drive (e.g., 'OldMacDrive'):"
read old_mac_drive

# Ensure old macOS drive is mounted
if ! mount | grep "$old_mac_drive" > /dev/null; then
  echo "Error: The old macOS drive is not mounted. Exiting."
  exit 1
fi

# Define the user settings directories for old and new user accounts
user_settings_dir="/Volumes/$old_mac_drive/Users/$old_username"
new_user_settings_dir="/Users/$current_user"

# Function to check available disk space
check_disk_space() {
  # Get available disk space for the new system disk (in GB)
  available_space=$(df -h / | grep -v Filesystem | awk '{print $4}' | sed 's/G//')
  
  # Assume not enough space if less than 10GB
  if (( available_space < 10 )); then
    return 0  # Low disk space
  else
    return 1  # Enough space
  fi
}

# Function to estimate total size of the files to copy
estimate_files_size() {
  # Get the size of the files to be copied (excluding Downloads, Movies, Pictures, etc.)
  total_size=$(du -sh --exclude='Downloads' --exclude='Movies' --exclude='Pictures' --exclude='Music' --exclude='Videos' "$user_settings_dir" | awk '{print $1}')
  echo $total_size
}

# Estimate files size
estimated_size=$(estimate_files_size)
echo "Estimated size of files to copy: $estimated_size"

# Check if there's enough space on the new disk
if ! check_disk_space; then
  echo "There is not enough space to copy the files. Available space: ${available_space}G, Estimated size: ${estimated_size}G"
  echo "Would you like to move the files instead of copying them? (move/skip)"
  read move_action
  case "$move_action" in
    "move")
      echo "Moving personal files..."
      
      # Moving files from the home folder excluding Downloads, Movies, etc.
      rsync -av --remove-source-files --progress --exclude 'Downloads' --exclude 'Movies' --exclude 'Pictures' --exclude 'Music' --exclude 'Videos' \
        "$user_settings_dir/" "$new_user_settings_dir/"
      break
      ;;
    "skip")
      echo "Skipping file operation due to insufficient space."
      exit 1
      ;;
    *)
      echo "Invalid option. Exiting script."
      exit 1
      ;;
  esac
fi

# If there is enough space, proceed to copy files
echo "There is enough space to copy the files. Proceeding with copying files..."

# Function to copy files if they exist
copy_if_exists() {
  src=$1
  dest=$2
  if [ -e "$src" ]; then
    echo "Copying $src to $dest..."
    rsync -av --progress "$src" "$dest"
  else
    echo "Warning: $src does not exist, skipping..."
  fi
}

# Common personal settings files to copy
echo "Copying system settings..."
# Finder settings
copy_if_exists "$user_settings_dir/Library/Preferences/com.apple.finder.plist" "$new_user_settings_dir/Library/Preferences/com.apple.finder.plist"
# Dock settings
copy_if_exists "$user_settings_dir/Library/Preferences/com.apple.dock.plist" "$new_user_settings_dir/Library/Preferences/com.apple.dock.plist"
# Launchpad layout
copy_if_exists "$user_settings_dir/Library/Application Support/Dock/desktoppicture.db" "$new_user_settings_dir/Library/Application Support/Dock/desktoppicture.db"
# WindowServer settings (Display resolution, screen arrangement)
copy_if_exists "$user_settings_dir/Library/Preferences/com.apple.windowserver.plist" "$new_user_settings_dir/Library/Preferences/com.apple.windowserver.plist"
# Device name and sharing settings
copy_if_exists "$user_settings_dir/Library/Preferences/SystemConfiguration/com.apple.smb.server.plist" "$new_user_settings_dir/Library/Preferences/SystemConfiguration/com.apple.smb.server.plist"
# Menu bar settings
copy_if_exists "$user_settings_dir/Library/Preferences/com.apple.systemuiserver.plist" "$new_user_settings_dir/Library/Preferences/com.apple.systemuiserver.plist"

# Ask to replace, merge, skip, or duplicate personal files
while true; do
  echo "Would you like to replace, merge, skip, or duplicate personal files? (replace/merge/skip/duplicate)"
  read file_action
  case "$file_action" in
    "replace")
      echo "Replacing personal files..."
      
      # Copying files from the home folder excluding Downloads, Movies, etc.
      rsync -av --progress --exclude 'Downloads' --exclude 'Movies' --exclude 'Pictures' --exclude 'Music' --exclude 'Videos' \
        "/Volumes/$old_mac_drive/Users/$old_username/" "/Users/$current_user/"
      break
      ;;
    "merge")
      echo "Merging personal files..."
      
      # Copying files from the home folder excluding Downloads, Movies, etc.
      rsync -av --ignore-existing --progress --exclude 'Downloads' --exclude 'Movies' --exclude 'Pictures' --exclude 'Music' --exclude 'Videos' \
        "/Volumes/$old_mac_drive/Users/$old_username/" "/Users/$current_user/"
      break
      ;;
    "skip")
      echo "Skipping personal file replacement..."
      break
      ;;
    "duplicate")
      echo "Duplicating personal files..."
      
      # Copying files from the home folder excluding Downloads, Movies, etc.
      rsync -av --progress --exclude 'Downloads' --exclude 'Movies' --exclude 'Pictures' --exclude 'Music' --exclude 'Videos' \
        "/Volumes/$old_mac_drive/Users/$old_username/" "/Users/$current_user/Backup/"
      break
      ;;
    *)
      echo "Invalid option. Please choose from 'replace', 'merge', 'skip', or 'duplicate'."
      ;;
  esac
done

# Completion message
echo "File copying complete. Thank you for using the script."

# Ask for shutdown, reboot, or nothing
while true; do
  echo "Would you like to restart, shut down, or do nothing? (restart/shutdown/nothing)"
  read action
  case "$action" in
    "restart")
      echo "Immediately restarting..."
      sudo shutdown -r now
      break
      ;;
    "shutdown")
      echo "Immediately shutting down..."
      sudo shutdown -h now
      break
      ;;
    "nothing")
      echo "Script complete, no action taken."
      break
      ;;
    *)
      echo "Invalid option. Please choose 'restart', 'shutdown', or 'nothing'."
      ;;
  esac
done
