#!/usr/bin/env bash

# Default folder name
folderName="GeneDeLisa"

# Ensure that at most one argument has been passed in.
if [ "$#" -eq 1 ]
then
	folderName=$1
elif [ "$#" -gt 1 ]
then
	echo -e "This script takes one argument at most.\\ne.g. install.sh \"GeneDeLisa\""
	exit 1
fi

# Determine the install directory.
installDirectory=~/Library/Developer/Xcode/Templates/Project\ Templates/"$folderName"

# Delete the install directory if it already exists to prevent deleted files from lingering.
if [ -d "$installDirectory" ]
then

    while true
    do
    echo ""
    # read a single char with the prompt
    read -n 1 -p "$installDirectory exists. Overwrite? [Y/n/q] " answer
    case $answer in

        [yY] | "" )
            echo ""
            echo "Okay, removing old $installDirectory."
	    rm -r "$installDirectory"
            # Create the install directory.
            mkdir -p "$installDirectory"
            break;;

        [nNqQ]* ) echo ""
            exit;;

        * ) echo "Dude, just enter Y or N or Q, kay?";;
    esac
done
fi

while true
do
    echo ""
    # read a single char with the prompt
    read -n 1 -p "Install templates to $installDirectory? [Y/n/q] " answer
    case $answer in

        [yY] | "" )
            echo ""
            echo "Okay, installing to $installDirectory."
            # Copy all of the xctemplate folders into the install directory.
            #cp -r *.xctemplate "$installDirectory"
            cp -r "Gene's Cocoa Application.xctemplate" "$installDirectory"
            cp -r "Gene's iOS Application.xctemplate" "$installDirectory"
            break;;

        [nNqQ]* ) echo ""
            exit;;

        * ) echo "Dude, just enter Y or N or Q, kay?";;
    esac
done
