set -gx fish_greeting ""
set -gx EDITOR vim

function vi; /Applications/MacVim.app/Contents/MacOS/Vim $argv; end
function vim; /Applications/MacVim.app/Contents/MacOS/Vim $argv; end

set -gx WORKON_HOME ~/.virtualenvs/
. ~/.config/fish/virtualenv.fish
. ~/.config/fish/prompt.fish

