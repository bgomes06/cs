#!/bin/bash

##########################################
#####      MY CHEATSHEET.SH         ######
##########################################

## DECLARE VARIABLES
N1=1
N2=5

## DECLARE FUNCTIONS

function new_git_repo() {
	read -p "Github username:" github_username
	test -z $github_username && echo "Github username required." 1>&2 && exit 1

	read -p "Repo name:" repo_name
	test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

curl -u 'github_username' https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"
}

function fun_git() {
'
git init
git config --global user.email mail@gmail.com"
git add <file>
git commit -m "first commit"
git remote add origin https://github.com/<user>/<repo>.git
git push -u origin master

** IF YOUR REMOTE ADD ORIGIN SITE IS WRONG, OVERWRITE USING THIS: **
git remote set-url origin https://github.com/bgomes06/cs.git

** TO CHANGE SOMETHING BEFOR PUSH **
git commit --amend

'
}

function fun_ifelse() {
	if [ $N1 -gt $N2 ]; then
		echo 'N1 is greater than N2.'
	elif [ $N1 -lt $N2 ]; then
		echo 'N1 is lesser than N2.'
	else
		echo 'N1 and N2 are equal.'
	fi
}

function fun_while() {
	while [ $N1 -le $N2 ]; do
		echo 'N1='$N1
		((N1++))
	done
}

function fun_for() {
	for i in 1 2 3 4 5
	do
		echo $i
	done
}

function fun_docker() {
        ## Simple docker container creation
        docker run -dit --name teste1 --hostname teste -v /teste:/container ubuntu:latest /bin/bash

}

echo 'Choose one option:'
echo '1) IF/ELSE'
echo '2) WHILE'
echo '3) FOR'
echo '4) REGEX'
echo '5) GITHUB REPO CREATE'
read -p 'Your option: ' opt

case $opt in
	1) fun_ifelse $N1 $N2;;
	2) fun_while ;;
	3) fun_for ;;
	4) fun_regex ;;
	5) new_git_repo ;;
	*) echo 'Wrong option. Aborting...'
esac
