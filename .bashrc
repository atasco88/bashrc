# .bashrc

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Having issues getting Guake to launch tmux and if bash loads tmux by default, Fedora login fails.
# The logic below determines if bash is being launched from Guake and if so will start tmux
BASH_PID=$(ps $$ | grep bash | sed -E "s/( )/\n/g" | grep -i "[0-9][0-9][0-9][0-9]")
BASH_PARENT_PID=$(ps -ef | grep $BASH_PID | head -1 | sed "s/ /\n/g" | grep [0-9][0-9][0-9][0-9] | tail -1)
PARENT_IS_GUAKE=$(ps -ef | grep $BASH_PARENT_PID | grep -c guake)

if [ $PARENT_IS_GUAKE -eq 1 ]
then
    exec tmux
fi

fortune
