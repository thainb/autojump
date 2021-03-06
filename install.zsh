#! /bin/zsh

#Copyright Joel Schaerer 2008, 2009
#This file is part of autojump

#autojump is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#autojump is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with autojump.  If not, see <http://www.gnu.org/licenses/>.

# applet icon
sudo mkdir -p /usr/share/autojump/
sudo cp icon.png /usr/share/autojump/

# scripts
sudo cp jumpapplet /usr/bin/
sudo cp autojump /usr/bin/

# man pages
sudo cp autojump.1 /usr/share/man/man1/

# autocompletion file in the first directory of the FPATH variable
sudo cp _j $(echo $FPATH | cut -d":" -f 1)


if [ -d "/etc/profile.d" ]; then
    sudo cp autojump.zsh /etc/profile.d/
    sudo cp autojump.sh /etc/profile.d/
    echo "Remember to add the line" 
    echo "    source /etc/profile.d/autojump.zsh"
    echo "or"
    echo "    source /etc/profile"
    echo "to your ~/.zshrc if it's not there already"
else
    echo "Your distribution does not have a /etc/profile.d directory, the default that we install one of the scripts to. Would you like us to copy it into your ~/.zshrc file to make it work? (If you have done this once before, delete the old version before doing it again.) [y/n]"
    read ans
    if [ ${#ans} -gt 0 ]; then
	if [ $ans = "y" -o $ans = "Y" -o $ans = "yes" -o $ans = "Yes" ]; then
	    echo "" >> ~/.zshrc
	    echo "#autojump" >> ~/.zshrc
	    cat autojump.zsh >> ~/.zshrc
	else
	    echo "Then you need to put autojump.zsh, or the code from it, somewhere where it will get read. Good luck!"
	fi
    else
    	    echo "Then you need to put autojump.zsh, or the code from it, somewhere where it will get read. Good luck!"
    fi
fi
