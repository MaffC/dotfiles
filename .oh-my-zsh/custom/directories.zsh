# Changing/making/removing directory
setopt auto_name_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Remove shitty definitions set in lib/directories.zsh
for f in $(alias|egrep "cd|dir"|awk -F '=' '{print $1}'); do unalias - $f; done
unset -f cd
