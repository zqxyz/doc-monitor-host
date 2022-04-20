#!/bin/bash

# Little confidence check
echo "This comes with no warranty. I am not an expert computer man."
echo "You agree by proceeding that all liability is yours."
echo -n "y/n: "
read ANSWER
case $ANSWER in
	y | Y)
		;;
	n | N)
		return;;
esac

echo "Installing doc-monitor"

# Create directory and give ownership to current user
sudo mkdir /opt/doc-monitor/
sudo chown $USER /opt/doc-monitor

# Move scripts into directory and make executable
mv doc-monitor-host.sh doc-monitor-config.sh doc-rm.sh /opt/doc-monitor/
cd /opt/doc-monitor && chmod 775 *

# Make cronjob at boot
(crontab -l ; echo "@reboot /opt/doc-monitor/doc-monitor-host.sh") 2> /dev/null | crontab -

# Try command line editor, fallback to DE set editor
if [ -z ${EDITOR} ];
then
	xdg-open /opt/doc-monitor/doc-monitor-config.sh;
else
	$EDITOR /opt/doc-monitor/doc-monitor-config.sh;
fi;

# Assume user set up config correctly
echo "Installation complete. Starting program."

# Add to PATH
echo "export PATH=/opt/doc-monitor:$PATH" >> $HOME/.bashrc

# Start script and disown (leave running after closing terminal)
bash /opt/doc-monitor/doc-monitor-host.sh > /dev/null &
disown %1
echo "Running in background. You may close the terminal."

