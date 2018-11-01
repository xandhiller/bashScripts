#
# tp_toggle
#
# Toggle the touchpad on/off.


# Get the id number of the touchpad.

notify="notify-send --icon=gtk-info -t 25"

tp_id=`xinput list | grep -i touchpad | awk '{ print $6 }' | sed 's/id=//'`


# Find out whether the touchpad is enabled or not.
tp_enabled=`xinput list-props $tp_id | grep Device\ Enabled | awk '{ print $4 }'`


if [ $tp_enabled = 0 ]
then
  # The touchpad is currently disabled, so turn it on.
  xinput set-prop $tp_id "Device Enabled" 1
  $notify "Touchpad now on."
elif [ $tp_enabled = 1 ]
then
  # The touchpad is currently enabled, so turn it off.
  xinput set-prop $tp_id "Device Enabled" 0
  $notify "Touchpad now off."
else
  $notify "tp_toggle: Could not get touchpad status from xinput."
  exit 1
fi
