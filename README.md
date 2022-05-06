# dotfile template

## Getting started

1. download this repo
2. read the bin/install.sh and install_000_SAMPLE
3. create your own install scripts, following the instructions in the SAMPLE file
4. put files you want distributed on your file system in root_folder (so a file you want installed to /etc should be placed in root_folder/etc)
5. push up to your own dotfile repo
6. run bin/install.sh

Any time you want to install a new package on your system, just add another install_* file to do it and then run bin/install.sh again to test/confirm

Any time you change a config file on your system you want saved, copy it to the place where it belongs in root_folder

Enjoy!
