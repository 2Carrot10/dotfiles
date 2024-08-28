This repo contains the main dotfiles I use on Arch Linux with AwesomeWM. The
locations of all configuration folders can be set up automatically with the
`setup.py` script, although make sure you read the logs carefully before
approving each change so preexisting files do not get deleted. Instead of
cloning each folder into the correct location, the `setup.sh` script creates
symlinks so you can edit all your dotfiles from one folder. You will still need
to install the software that uses each config. 

To install these dotfiles, either download this GitHub repo or run this command in the desired location:
`curl -s https://raw.githubusercontent.com/2Carrot10/dotfiles/master/install.sh | bash`
