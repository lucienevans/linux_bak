#!/bin/sh
#
# name     : tmuxen， tmux environment made easy
# author   : Xu Xiaodong xxdlhy@gmail.com
# license  : GPL
# created  : 2012 Jul 01
# modified : 2012 Jul 02
#

cmd=$(which tmux) # tmux path
session=BGI   # session name

if [ -z $cmd ]; then
	echo "You need to install tmux."
	exit 1
fi

$cmd has -t $session

if [ $? != 0 ]; then
	$cmd new -d -s $session -n shell1 "bash"
	$cmd splitw -h -t $session "bash"
	$cmd splitw -v -t $session "bash"
	$cmd neww -t $session -n shell2 "bash"
	$cmd splitw -h -t $session "bash"
	$cmd selectw -t $session:0
fi

$cmd att -t $session

exit 0