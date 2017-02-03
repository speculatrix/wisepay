# wisepay

A tool for scraping the wisepay website to get the current balance and
a plugin for munin so it can be graphed.

This is not an example of beautiful coding or elegant design, it's a crude
method of connecting to Wisepay's site, logging in, and fetching the
food and drink balance. The relevant bit of HTML is extracted rather
than loading it into a structured HTML document.

It works, until Wisepay change their web site.


##Configuration

Find the MID that your college uses by logging into Wisepay and looking
at the URL, it will have mID=1234 in it, and put it into the config.sh
file.

Put your usename and password into the config.sh file


##Usage

Simply call the get_balance.sh script and it prints the value


##Using with munin-node

In the munin user's home directory, make a directory called wisepay and
another called .wisepay, and change their ownership to munin. Then copy
the get_balance.sh and config.sh to the wisepay directory.

Copy the file munin-plugin-wisepay to /etc/munin/plugins/wisepay and
add these two lines to /etc/munin/plugin-conf.d/munin-node :

<code>
[wisepay]
        user            munin
<code>


##Bugs

Stops working when wisepay make small changes to their website.

Munin node plugin doesn't run correctly when you use "munin-run wisepay" without hacking the value of HOME
