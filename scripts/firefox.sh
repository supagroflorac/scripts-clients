#!/bin/bash

# Configuration de firefox
echo "user_pref(\"browser.startup.homepage\",\"http://www.cdrflorac.fr\");
user_pref(\"print.postscript.paper_size\",\"A4\"" > /etc/firefox/syspref.js
