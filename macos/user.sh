###############################################################################
# Create new user
###############################################################################
# http://dareneiri.github.io/Creating-A-New-User-in-Terminal/
# https://www.techradar.com/how-to/computing/apple/terminal-101-creating-new-users-1305687
# http://fondofit.com/others/mac-os/how-to-add-a-user-in-mac-os-using-terminal/
# https://gist.github.com/igorvoltaic/ff3eed83aa0c37a85d1802b4fa40609a

sudo dscl . create /Users/elevadmin
sudo dscl . create /Users/elevadmin UserShell /bin/bash
sudo dscl . create /Users/elevadmin RealName "Elevation Admin"
sudo dscl . create /Users/elevadmin UniqueID 503
# 80 for admin, 20 for standard
sudo dscl . create /Users/elevadmin PrimaryGroupID 80

sudo dscl . create /Users/elevadmin NFSHomeDirectory /Users/elevadmin
sudo dscl . passwd /Users/elevadmin 7800
sudo dscl . append /Groups/admin GroupMembership elevadmin

sudo createhomedir -u elevadmin -c


###############################################################################
# Set photo for admin user
###############################################################################
# https://www.jamf.com/jamf-nation/discussions/4332/how-to-change-local-user-account-picture-through-command-terminal
# https://github.com/quedayone/jamf-pro-scripts/blob/master/user-picture-change

sudo cp -r ~/.dotfiles/macos/assets/ /Library/User\ Pictures/
sudo dscl . delete /Users/elevadmin jpegphoto
sudo dscl . delete /Users/elevadmin Picture
sudo dscl . create /Users/elevadmin Picture "/Library/User Pictures/Elevation/Elevation_Avatar.png"


###############################################################################
# Hide admin user
###############################################################################
# https://support.apple.com/en-us/HT203998

sudo dscl . create /Users/elevadmin IsHidden 1
sudo mv /Users/elevadmin /var/elevadmin
sudo dscl . create /Users/elevadmin NFSHomeDirectory /var/elevadmin
sudo dscl . delete "/SharePoints/Elevation Admin's Public Folder"
