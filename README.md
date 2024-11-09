# the-real-express-setup
Easy upgrading and downgrading macOS with this script!

**Ever had that annoying problem of forgetting to do a SuperDuper! or Time Machine backup, upgrading macOS'es, then completely regretting it the second you get a beachball while setting up? This is a solution for you!**
the-real-express-setup, a script that can fix that problem.

# How to use the-real-express-setup
Prerequistes:
- 2 macOS installs on seperate partitions
- Both installs setup and ready to go
- The script file
- A brain

Steps:
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
No, there is no guarantee to it fully working. There may be errors, but as this was just a script I made in my spare time, I probably won't be working on it anymore. Feel free to add any problems in the issues page and I will see if I have the time to work on the script.

*Do I lose any data or break anything using this script?*
There is always the slight chance you can lose data or break your OS X/macOS install using this script, but is very uncommon and most likely won't happen unless the script is abruptly interrupted by a random power-off, freezing, etc.

*Will it look the exact same as my previous copy of macOS?*
Not nessacarily, the aim of this script was to get it to be as close to being a backup as possible. Now, yes, there are methods that can make that happen but I don't think I will be attempting to play around with system files to make that happen. The end result I've gotten so far is very close and the only things I've had to adjust has been wallpaper, brightness and my sharing settings.

*Does this work on patched Mac's using patchers such as Opencore Legacy Patcher or Hackintoshs?*
I have tested this whole script on a mid-2014 MacBook Pro going from Ventura to Monterey after making the regrettable decision to go from Big Sur to Ventura and it worked just as I wanted it to. There is no guarantee it will work for other computers, or anything.

*Do you need any prerequisites?*
No, it uses commands already built into the system and just uses those.

*What will I most likely need to do on my own?*
Some system settings as they are relying on system files and are best not to touch them and rather do on your own, installing software such as Python, Oh-My-Zsh, and copying over your applications.

*Let's say I have 100gb out of 128gb available on my new macOS install and 120gb of 128gb used on my old install, can I simply move it without a fuss?*
Not at the moment, I am looking to have this as an option in the not-too-distant future.

# Responsibility Info
I am not responsible for the damage of you're Mac if it is either corrupted or damaged. No warranty is INCLUDED. If anything happens, fault goes on YOU.
# Support Info
If you need support, please [contact me](mailto:m4halgita@yahoo.com) or make a issue on this repository.
# Extra info for Developers
If you would like a uncompiled copy of this app, download the code for this repo. The source code includes an uncompiled Xcode Project for Prank 1.2.1-alpha-v1 for developers.
# Requests
If you would like to add a request, either send it as an issue or [contact me](mailto:m4halgita@yahoo.com).
