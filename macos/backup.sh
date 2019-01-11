###############################################################################
# Backup old machine's dotfiles                                               #
###############################################################################

mkdir -p ~/migration/home/
mkdir -p ~/migration/Library/Application\ Support/
mkdir -p ~/migration/Library/Preferences/
mkdir -p ~/migration/rootLibrary/Preferences/SystemConfiguration/

cd ~/migration

# what is worth reinstalling?
brew leaves              > brew-list.txt    # all top-level brew installs
brew cask list           > cask-list.txt
npm list -g --depth=0    > npm-g-list.txt
yarn global list --depth=0 > yarn-g-list.txt

# then compare brew-list to what's in `brew.sh`
#   comm <(sort brew-list.txt) <(sort brew.sh-cleaned-up)

# backup some dotfiles likely not under source control
cp -Rp \
    #~/.atom \
    ~/.vscode \
    ~/.bash_history \
    ~/.ssh \
    ~/migration/home
    #~/.extra \
    #~/.extra.fish \
    #~/.gitconfig.local \
    #~/.gnupg \
    #~/.nano \
    #~/.nanorc \
    #~/.netrc \
    #~/.z   \
    

# files in home folder
cp -Rp ~/Documents ~/migration/home
cp -Rp ~/Pictures ~/migration/home

# all those fonts you've installed
cp -Rp ~/Library/Fonts ~/migration/Library/

# iMessage backup
cp -Rp ~/Library/Messages ~/migration/Library/

# PDF filters
cp -Rp ~/Library/Filters ~/migration/Library/

#cp -Rp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ~/migration/rootLibrary/Preferences/SystemConfiguration/ # wifi

# app settings & plugins
cp -Rp ~/Library/Preferences/com.iconfactory.xScope.plist ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/com.mti.Monotype-SkyFonts.plist ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/com.panic.Coda2.plist ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/com.pilotmoon.popclip.plist ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/com.runningwithcrayons.Alfred-3.plist ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/com.runningwithcrayons.Alfred-Preferences-3.plist ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/com.apple.Terminal.plist ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/Adobe\ Photoshop\ CC\ 2017\ Settings  ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/Adobe\ Photoshop\ CC\ 2018\ Settings  ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/Adobe\ InDesign  ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/Adobe\ Illustrator\ 21\ Settings  ~/migration/Library/Preferences
cp -Rp ~/Library/Preferences/Adobe\ Illustrator\ 22\ Settings  ~/migration/Library/Preferences

#cp -Rp ~/Library/Application\ Support/Google/Chrome ~/migration/Library/Application\ Support
cp -Rp ~/Library/Application\ Support/PopClip ~/migration/Library/Application\ Support
cp -Rp ~/Library/Application\ Support/Atom ~/migration/Library/Application\ Support
cp -Rp ~/Library/Application\ Support/Coda\ 2 ~/migration/Library/Application\ Support
cp -Rp ~/Library/Application\ Support/Code ~/migration/Library/Application\ Support
cp -Rp ~/Library/Application\ Support/Sketchpacks ~/migration/Library/Application\ Support
cp -Rp ~/Library/Application\ Support/com.bohemiancoding.sketch3 ~/migration/Library/Application\ Support

# Finder settings
# Not sure how to do this yet. Really want to.