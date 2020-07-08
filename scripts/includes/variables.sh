#!/usr/bin/env bash

# ----------------------------------------------------
# Vars to get current user
# ----------------------------------------------------
ME=$(whoami);

# ----------------------------------------------------
# Vars to get date time in build time
# ----------------------------------------------------
DATETIME=$(date '+%d/%m/%Y %H:%M:%S');

# ----------------------------------------------------
# Vars to get day
# ----------------------------------------------------
DAY=$(date '+%a');

# ----------------------------------------------------
# Vars to get month
# ----------------------------------------------------
MONTH=$(date '+%b');

# ----------------------------------------------------
# Vars to get year
# ----------------------------------------------------
YEAR=$(date '+%Y');

# ----------------------------------------------------
# Vars to get hour
# ----------------------------------------------------
HOUR=$(date '+%H');

# ----------------------------------------------------
# Vars to get minute
# ----------------------------------------------------
MINUTE=$(date '+%M');

# ----------------------------------------------------
# Vars to get second
# ----------------------------------------------------
SECOND=$(date '+%S');

binary=( node docker docker-compose yarn go www )
tutorial=( 
    "https://nodejs.org/en/download/" 
    "https://docs.docker.com/get-docker/" 
    "https://docs.docker.com/compose/install/" 
    "https://legacy.yarnpkg.com/lang/en/docs/install/" 
    "https://golang.org/doc/install" 
    "https://devetek.com" 
    )