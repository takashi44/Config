export MLSDK=~/Dev/MagicLeap/mlsdk
export PATH="~/bin:$MLSDK/tools/mldb:${PATH}"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH=${PATH}:~/Library/Python/3.7/bin
export PS1="[\u@\h] \w\n> "
set autolist
source ~/.aliases
function fp() { echo `pwd`/"$@" ; }
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/takashi/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/takashi/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/takashi/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/takashi/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

