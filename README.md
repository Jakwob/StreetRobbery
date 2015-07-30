# StreetRobbery

This is a robbery system where you can rob any player within a certian distance, but in order to perform a robbery you will need to have a knife equipped, there is also a 75% chance you will not succeed, you can rob a player for an amount between $100 and $100,000.

Commands:
/sr
/srhelp

Features:
Custom robbery amount
Need to be near player to rob
Knife needs to be equipped to rob
Wanted stars for robbing
75% chance for failing

How To Customize:

Find:
MAX_ROBBERY_AMOUNT 100000 (you can change to max amount)
MIN_ROBBERY_AMOUNT 100 (you can change to min amount)

Requirements:
zcmd.inc
sscanf2.inc
sscanf.dll/so
foreach.inc (required for the Message.inc)
Message3.inc

Installation:
Place the .amx in the 'filterscripts' folder
add sr.amx in your server.cfg on the filterscript line
Run and enjoy!

Dont forget to keep my name in the credits.
