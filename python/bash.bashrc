PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@$( python3 --version | awk '{ print $2 }')\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
source ~/.bash_aliases
export PATH="/venv/bin:$PATH"
