# wisepay
A tool for scraping the wisepay website to get the current balance

##Configuration

Find the MID that your college uses by logging into Wisepay and looking
at the URL, it will have mID=1234 in it, and put it into the config.sh
file.

Put your usename and password into the config.sh file

##Usage

Simply call the script and it prints the value


##Using with munin-node

Coming soon.
But briefly, create a cron jon which calls the get_balance.sh a few times a day, and then have a munin-plugin which reads it, much more friendly than calling get_balance.sh every five minutes.

