#!/bin/bash

. ./config.sh

DBGLVL=0
FETCH=0
CURLOPTS="--silent"

URLLOGIN="https://www.wisepay.co.uk/store/parent/process.asp"
URLBALANCE="https://www.wisepay.co.uk/store/parent/default.asp?view=account"


if [ ! -d "$ROOTDIR" ] ; then
	mkdir -p "$ROOTDIR"
	if [ $? -ne 0 ] ; then
		echo "Failed to make directory '$ROOTDIR'"
		exit 1
	fi
fi


# need to login and fetch the page?
if [ $FETCH -ne 0 -o ! -f "$COOKIEFILE" ] ; then

	# log in to make a cookie file
	curl $CURLOPTS					\
		-o /dev/null				\
		-c "$COOKIEFILE"			\
		"$URLLOGIN"				\
		--data-urlencode "mID=$MID"		\
		--data-urlencode "ACT=login"		\
		--data-urlencode "acc_user_email=$USER"	\
		--data-urlencode "acc_password=$PASS"

	# use the cookie file to get the home page
	curl $CURLOPTS					\
		-o "$HOMEPAGEFILE"			\
		-b "$COOKIEFILE"			\
		"$URLBALANCE"

fi


# extract the catering balance

grep 'Food and Drink Balance' $HOMEPAGEFILE | grep '&pound;' | sed -r -e 's#.*&pound; ##g' -e 's#</span></span><br>.*##g'

if [ $DBGLVL -eq 0 ] ; then
	rm $COOKIEFILE $HOMEPAGEFILE
fi


# end get_balance.sh
