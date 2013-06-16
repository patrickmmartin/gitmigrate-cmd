# Git migration helper

## Overview
When the SVN formats might now match in the toolkits, simply spin up the svn server and talk to that.

## Usage
Almost couldn't be simpler - ``` svnserve2git [repodir] ```

_repodir_ is the name of an SVN repo in the current working directory

### Prerequisites

Windows - tested on Windows 7
Full set of SVN binaries on the path, sull set of git binaries on the path.

### Outputs

You will get a git repo called localhost with the import of the svn repo

## What use is this?
See my post for the issue with formats - 
http://docmartinscodingstuff.blogspot.co.uk/2011/08/and-with-one-mighty-bound-he-was-free.html
- if you set the path up with the appropriate binaries,
you can manage an export of an svn repo without having to perform changes to the system config
