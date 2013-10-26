# mostly from http://coderseye.com/2010/using-virtualenv-with-fish-shell.html

function workon -d "Activate virtual environment in $WORKON_HOME"
  set tgt {$WORKON_HOME}/$argv[1]

  if [ ! -d $tgt ]
    mkdir -p "$WORKON_HOME"
    virtualenv $tgt
  end

  if [ -d $tgt ]
    cd $tgt

    deactivate

    set -gx VIRTUAL_ENV "$tgt"
    set -gx _OLD_VIRTUAL_PATH $PATH
    set -gx PATH "$VIRTUAL_ENV/bin" $PATH

    # unset PYTHONHOME if set
    if set -q PYTHONHOME
       set -gx _OLD_VIRTUAL_PYTHONHOME $PYTHONHOME
       set -e PYTHONHOME
    end

    cd -
    echo "activated $tgt"
  else
    echo "$tgt not found"
  end
end

complete -c workon -a "(ls $WORKON_HOME)"

function deactivate -d "Exit virtualenv and return to normal shell environment"
    # reset old environment variables
    if test -n "$_OLD_VIRTUAL_PATH"
        set -gx PATH $_OLD_VIRTUAL_PATH
        set -e _OLD_VIRTUAL_PATH
    end
    if test -n "$_OLD_VIRTUAL_PYTHONHOME"
        set -gx PYTHONHOME $_OLD_VIRTUAL_PYTHONHOME
        set -e _OLD_VIRTUAL_PYTHONHOME
    end
    set -e VIRTUAL_ENV
end

function mkvirtualenv -d "Creates a new virtual environment in $WORKON_HOME"
  set tgt {$WORKON_HOME}/$argv[1]
  virtualenv $tgt
  workon $argv[1]
end

function rmvirtualenv -d "Deletes a virtual environment from $WORKON_HOME"
  set tgt {$WORKON_HOME}/$argv[1]
  rm -rf $tgt
end

complete -c rmvirtualenv "(ls -d $WORKON_HOME)"
