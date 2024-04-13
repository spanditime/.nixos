#!/usr/bin/env bash
nmcli -g name,type c s --active | grep ":802-11-wireless\$" | sed "s/^\\(.*\\):802-11-wireless\$/\\1/" 
