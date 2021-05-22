# ArgosCpuMem

A CPU & Memory monitor for Gnome Extension Argos

## General Purpose
The program scan the active load of each CPU and the memory, display a general Health Smiley on the status bar. By accessing to details each CPU and the memory are checked.
At the beginnig of the script, it's necessary to customlize the parameters and the limits.

## Installation
This repository has only one file: CpuMem.30s.sh.
The Scanning Interval depend of the file name (30s = 30 seconds, 1m = 1 minute...); it's a standard in Argos extensions.
The parameters are described in the script
The script file must be installed in standard Argos folder:
     $HOME/.config/argos
     with correct righs: chmod +x PwdGen.sh

## Parameters
The parameters are in mais file:
NumberProcessors=4		# The number of processors the machine have
CpuWarning=50			# The CPU warning theshold
CpuAlert=80				# The CPU alert theshold
MemWarning=50			# The memory warning theshold
MemAlert=80				# The memory alert theshold
NbWarning=2				# General Warning from 1 to this value, General Alert if more

## Extra
Standard Emojs could be find in this Gnome extension: https://extensions.gnome.org/extension/1162/emoji-selector/
Standard icons could be find in terminal command: gtk3-icon-browser
Exemples of programming are found in wiki Argos --> https://github.com/p-e-w/argos/wiki
