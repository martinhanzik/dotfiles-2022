source (dirname (status -f))/aliases.fish
source (dirname (status -f))/completions.fish

set -gx EDITOR vim

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -gx LESS '-F -g -i -M -R -S -w -X -z-4'

if status --is-login
    source (dirname (status -f))/env.fish
end

source /opt/homebrew/opt/asdf/libexec/asdf.fish

source (dirname (status -f))/path.fish

function __direnv_export_eval --on-variable PWD
    status --is-command-substitution; and return
    eval (direnv export fish)
end

direnv hook fish | source

eval (starship init fish)
