# the-real-express-setup
Easy upgrading and downgrading macOS with this script!

**Ever had that annoying problem of f-ing up your Filevault encryption, forgetting to do a SuperDuper! or Time Machine backup before updating then completely regretting it the second you get a beachball while setting up? This is a solution for you!**
the-real-express-setup, a script that can fix that problem.

# How to use the-real-express-setup
Prerequisites:
- 2 macOS installs on seperate partitions
- Both installs setup and ready to go
- The script file
- A brain

Steps:
- Copy/install all your previous apps to make sure everything works properly
- Open Terminal
- Run the script (e.g. /Users/hanlyw/Downloads/the-real-express-setup.sh)
- Press Y when it asks you to accept the risk (this is up to you boss)
- Give your password if it asks to, this is required to be able to copy your settings
- Choose to replace, merge, duplicate or skip any duplicate files on your new install
- Sit back and relax, you may need to type your password at some point to give proper permissions
- Once done, choose if you would like to shutdown, reboot or be as-is and do it later.
- Voila!

# FAQ
*What does this script do?*
the-real-express-setup copies over all your personal files, including downloads, movies, photos and much more, along with some of your personalised settings such as display resolution, menu bar settings, login items, dock and much more.

*Does this 100% work?*
No, there is no guarantee to it fully working. There may be errors, but as this was just a script I made in my spare time, I probably won’t be working on it anymore. Feel free to add any problems in the issues page and I will see if I have the time to work on the script.

*Do I lose any data or break anything using this script?*
There is always the slight chance you can lose data or break your OS X/macOS install using this script, but is very uncommon and most likely won’t happen unless the script is abruptly interrupted by a random power-off, freezing, etc.

*Will it look the exact same as my previous copy of macOS?*
Not necessarily, the aim of this script was to get it to be as close to being a backup as possible. Now, yes, there are methods that can make that happen but I don’t think I will be attempting to play around with system files to make that happen. The end result I’ve gotten so far is very close and the only things I’ve had to adjust has been wallpaper, brightness and my sharing settings.

*Does this work on patched Mac’s using patchers such as OpenCore Legacy Patcher or Hackintoshs?*
I have tested this whole script on a mid-2014 MacBook Pro going from Ventura to Monterey after making the regrettable decision to go from Big Sur to Ventura and it worked just as I wanted it to. There is no guarantee it will work for other computers, or anything.

*Do you need any prerequisites?*
No, it uses commands already built into the system and just uses those.

*Can I use this to upgrade SSD's while up/down-grading OS'es and transfer my data?*
Yes, it should work with no issue whatsoever.

*What will I most likely need to do on my own?*
Some system settings as they are relying on system files and are best not to touch them and rather do on your own, installing software such as Python, Oh-My-Zsh, and copying over your applications.

*Why is some of my apps missing from the dock?*
It is recommended to copy/install all your previous applications to get as much of a seamless transfer as possible. Some apps may not show up if you are changing OS'es, such as System Settings, that would become System Preferences if you were going from Ventura to Monterey, causing a question mark symbol in the dock. It relies off of names of apps rather than the actual apps themselves.

*Does this transfer over features from newer macOS'es or older versions?*
No, you will not be getting Apple Intelligence going from macOS Sequoia to macOS Sonoma.

*Let’s say I have 100gb out of 128gb available on my new macOS install and 120gb of 128gb used on my old install, can I simply move it without a fuss?*
Yes! That's a new feature we have added, now ensuring those with less disk space then they need that they can move their files in 1 go, not needing to copy, delete, copy, delete, manually. If the script detects you have less space than what's required, it will offer you the ability to move instead of copying your files.

*Can I go up or down versions using this script?*
The script supports both upgrading and downgrading, as long as you have 2 partitions (2 installs), all setup and ready to go, it should work just fine.

*I can't open the script, it says I don't have permission!*
Please run the command chmod +x /path/to/the-real-express-setup.sh and it should run no problem. Try again as sudo chmod +x /path/to/the-real-express-setup.sh and enter your password if the previous command doesn't work.

*What do I do after using the script?*
Restart, ensure everything worked, if not, retry the script. If it did, personalise to your own liking, and remove the partition using Disk Utility or any disk management application you prefer, as long as it gets the job done.

# Responsibility Info
I am not responsible for the damage of your Mac if it is either corrupted or damaged. No warranty is INCLUDED. If anything happens, fault goes on YOU for taking the risk.

# Support Info
If you need support, please [contact me](mailto:m4halgita@yahoo.com) or make an issue on this repository.

# Requests
If you would like to add a request, either send it as an issue or [contact me](mailto:m4halgita@yahoo.com).

# Changelogs
- Give the option to move instead of copying for those who don't have enough disk space on 1 drive. (must have less than sufficient disk space to be offered to move files) - v1.0.1
- Make personal files be the first thing to move and give a confirmation, just to make sure you have the chance to change your mind. Previously, settings would automatically transfer without confirmation then ask to transfer personal files, now different to ensure you can change your mind and have your install in the exact same state as you previously had it. - v1.0.1

# Upcoming features
- N/A, recommend us some in the issues tab!
