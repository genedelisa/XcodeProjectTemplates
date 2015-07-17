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

echo "Templates will be installed to $installDirectory"

# Delete the install directory if it already exists to prevent deleted files from lingering.
if [ -d "$installDirectory" ]
then
	rm -r "$installDirectory"
fi

# Create the install directory.
mkdir -p "$installDirectory"

# Copy all of the xctemplate folders into the install directory.
#cp -r *.xctemplate "$installDirectory"
cp -r "Gene's Cocoa Application.xctemplate" "$installDirectory"
cp -r "Gene's iOS Application.xctemplate" "$installDirectory"

# Create empty directories that the project templates will copy.
# mkdir -p "$installDirectory"/"Gene's Cocoa Application.xctemplate/Whatever"
