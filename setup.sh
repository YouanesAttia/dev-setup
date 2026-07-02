#!/usr/bin/env bash

set -e

# Chech the OS
if [[ ! -f /etc/os-release ]]; then
    echo "Cannot determine operating system."
    exit 1
fi

source /etc/os-release

if [[ "$ID" != "ubuntu" && "$ID" != "debian" ]]; then
    echo "This script only supports Ubuntu/Debian."
    exit 1
fi

echo "Detected: $PRETTY_NAME"

#Install packages
echo "Updating package lists.."
sudo apt update

echo
echo "Installing packages.."
sudo apt install -y \
	git\
	gcc\
	g++\
	cmake\
	valgrind\
	python3\
	python3-pip\
	vim

#Configures git
echo "Git configuration"
read -p "Enter the username: " username
read -p "Enter hte Email: " email

git config --global user.name "$username"
git config --global user.email "$email"
git config --global init.defaulBranch main

#Create directories
echo "Creating directories.."
mkdir ~/projects/cpp ~/projects/python ~/notes

# Add aliases
echo "Adding useful aliases..."

BASHRC="$HOME/.bashrc"

add_alias() {
    local alias_text="$1"

    if ! grep -Fxq "$alias_text" "$BASHRC"; then
        echo "$alias_text" >> "$BASHRC"
    fi
}

add_alias "alias gs='git status'"
add_alias "alias ga='git add'"
add_alias "alias gc='git commit'"
add_alias "alias gp='git push'"
add_alias "alias gl='git pull'"
add_alias "alias ll='ls -la'"
add_alias "alias ..='cd ..'"
add_alias "alias ...='cd ../..'"

#message

echo "Setup completed successfuly!"

echo "Installed versions: "
echo

printf "%-12s %s\n" "Git:" "$(git --version)"
printf "%-12s %s\n" "GCC:" "$(gcc --version | head -n1)"
printf "%-12s %s\n" "G++:" "$(g++ --version | head -n1)"
printf "%-12s %s\n" "CMake:" "$(cmake --version | head -n1)"
printf "%-12s %s\n" "Valgrind:" "$(valgrind --version)"
printf "%-12s %s\n" "Python:" "$(python3 --version)"
printf "%-12s %s\n" "Pip:" "$(pip3 --version | awk '{print $1, $2}')"
printf "%-12s %s\n" "Vim:" "$(vim --version | head -n1)"

