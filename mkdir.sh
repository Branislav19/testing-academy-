#!/usr/bin/env bash

# ak yadam priecinok , tak je vytvoreny

[[ $(mkdir xxx && [[ -d xxx ]] && [[ $(ls -a xxx | wc -l ) -eq 2 ]] && echo passed || echo failed: when i create new folder then folder is created


# ak zadam priecinok , ktory uz existuje , tak vypise chybu
[[ $(mkdir xxx 2>&1) = "mkdir: cannot create directory 'xxx': File exists" ]] || echo failed: when new folder witch existing name is going to be vreated then error message is shown


 
