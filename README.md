# JNL

This is a simple bash script for creating a daily journal or log entry on OS X.

It will create a new file at some-folder/YYYY/MM/DD.ext and then open that file in the editor of your choice. If the file already exists, it will be opened for editing.

## Install

2. Create a folder to store your documents.
1. Download the JNL scripts.
2. `cd` into the JNL scripts directory and `chmod ug+x ./jnl.sh`.
3. Copy `JNL/CONFIG.example.sh` to `JNL/CONFIG.sh`.
4. Update `JNL/CONFIG.sh` to reflect your current configuration.
5. Add an alias to `~/.bash_profile`...

```
if [ -f /FULL/PATH/TO/JNL_FOLDER/jnl.sh ];then
  alias jnl="/FULL/PATH/TO/JNL_FOLDER/jnl.sh"
fi
```

# Usage
Type `jnl`. A file should open for editing. If not, then check your CONFIG.sh file for problems.
