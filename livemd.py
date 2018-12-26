#! /home/polluticorn/anaconda3/bin/python3

import os
import sys

# [DONE] Take in the full path of the file
# [DONE] Generate the swp file name
# [DONE] Track it with entr
# [DONE] Run the compile argument
# [DONE] Detach from both the tracking and the opening

def notifySend(string):
  os.system('notify-send "' + string + '"')

  
fullPath  = sys.argv[1]
notifySend(' '.join(sys.argv))

fileName  = fullPath.split('/')[-1]
swpFile   = '.' + fileName + '.swp'
pathHead  = fullPath.split(fileName)[0]

notifySend(fileName + ' ' + swpFile + ' ' + pathHead)

command = 'echo ' + pathHead + swpFile + \
          ' | entr pandoc -f markdown '  \
          + fullPath + ' -o /tmp/livemd.pdf'
          
openCommand = 'zathura /tmp/livemd.pdf'

os.system('nohup ' + command      + ' 2> /dev/null > /dev/null &')
os.system('nohup ' + openCommand  + ' 2> /dev/null > /dev/null &')

# os.system(command)
# os.system(openCommand)

# print('nohup ' + command      + ' 2> /dev/null > /dev/null &')
# print('nohup ' + openCommand  + ' 2> /dev/null > /dev/null &')

