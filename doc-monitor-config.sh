#!/bin/bash

# Frequency is maximum amount of time an update made to files 
# directly on the server will take to push to active clients
FREQUENCY=90s
PREV_MODTIME_FILE=/opt/doc-monitor/.pi_doc_mod_time
OUT=/opt/doc-monitor/.rmlist
NODE=~/Documents/$1
