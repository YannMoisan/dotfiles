#!/bin/sh
#WMFS status.sh example file
TIMING=1
statustext()
{
    wmfs -c status "default `date`"
}
while true;
do
    statustext
    sleep $TIMING
done
