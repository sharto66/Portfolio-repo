import re
import os
import sys
import readline
import shlex
import glob

prompt = "sh>> "

# Parsed splitting of input into constituent arguments
def parse(cmd):
  return shlex.split(cmd)

def internal(argv):
  cmd = argv[0]
  if cmd == "copyright":
    return copyright()

  return False

# Execute an execute command (i.e. run a  program on disk)
# If this succeeds it never returns
def execute(cmd, argv):
  try:
    os.execv(cmd, argv)
  except OSError: pass

def call(argv):
  background = ""
  background = argv[-1]
  if os.fork() == 0:
    cmd = argv[0]
    if '&' in argv[-1]:
      argv.remove('&')
#####FILE GLOBBING############################
    for i in range(len(argv)):
      if '*' in argv[i]:
        argv.extend(glob.glob(argv[i]))
        argv.pop(i)
###############################################
    if '>' in argv:
      filename = argv[-1]
      argv.remove('>')
      argv.remove(filename)
      fd = os.open(filename, os.O_CREAT | os.O_TRUNC | os.O_RDWR)
      os.dup2(fd, 1)
##############################################
    if '<' in argv:
      filename = argv[-1]
      argv.remove('<')
      argv.remove(filename)
      fd = os.open(filename, os.O_RDONLY)
      os.dup2(fd, 0)
##############################################
    if '|' in argv:
      if argv.count("|") == 1:
        argv1 = []
        pos = argv.index("|")
        for i in range(len(argv)):
          if i > pos:
            argv1.append(argv[i])
        argv.remove("|")
        for j in range(len(argv1)):
          if argv1[j] in argv:
            argv.remove(argv1[j])
        from subprocess import Popen, PIPE, STDOUT
        p1 = Popen(argv, stdout=PIPE)
        p2 = Popen(argv1, stdin=p1.stdout)
        stdout, stderr = p2.communicate()
        os._exit(1)
      if argv.count("|") == 2:
        argv1 = []
        argv2 = []
        pos = argv.index("|")
        pos1 = argv.index("|", pos+1)
        #print(pos)
        #print(pos1)
        for i in range(len(argv)):
          if i > pos and i < pos1:
            argv1.append(argv[i])
        for i in range(len(argv)):
          if i > pos1:
            argv2.append(argv[i])
        argv.remove("|")
        argv.remove("|")
        for j in range(len(argv1)):
          if argv1[j] in argv:
            argv.remove(argv1[j])
        for j in range(len(argv2)):
          if argv2[j] in argv:
            argv.remove(argv2[j])
        #print(argv)
        #print(argv1)
        #print(argv2)
        from subprocess import Popen, PIPE, STDOUT
        p1 = Popen(argv, stdout=PIPE)
        p2 = Popen(argv1, stdin=p1.stdout, stdout=PIPE)
        p3 = Popen(argv2, stdin=p2.stdout)
        stdout, stderr = p3.communicate()
        os._exit(1)
###############################################
    if '/' in cmd:
      # Relative or absolute path specified
      execute(cmd, argv)
    else:
      for dir in os.getenv('PATH').split(':'):
        execute(dir + '/' + cmd, argv)

    # If we get here then execution has failed
    sys.stderr.write('Unrecognised command: ' + cmd + '\n')
    os._exit(1)
  else:
    if background != "&":
      os.wait()

# Read, print, eval, loop (REPL)
while True:
  try:
    cmd = input(prompt).strip()
    if cmd == "":
      pass
    elif cmd == "exit":
      # Exit the shell
      break
    else:
      argv = parse(cmd)
      if not internal(argv):
        call(argv)
  except EOFError:
      # User has pressed Ctrl-D
    break
