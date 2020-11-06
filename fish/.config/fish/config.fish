set -gx PATH "/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt:/opt/custom:/home/kubakorba/.custom:/opt:/opt/custom:/home/kubakorba/.custom:/home/kubakorba/.opt:/home/kubakorba/.opt/cross/bin"

set -gx EDITOR "vim"

set -gx TERM "xterm-256color"

alias open='mimeo'
alias takemehome="cd"
alias show='qlmanage -p "$argv" &> /dev/null'
alias rmf='command rm "$argv"'
alias rmd='command rm -rf "$argv"'
alias reinternet='sudo systemctl restart connman'
alias pbcopy='xclip -selection clipboard'

alias lc='tree $argv | lolcat'
alias lsc='colorls --sd'
alias lc='colorls --tree --sd'
alias ll='ls -a'
alias la='ls -a'


alias mcat='command cat'
alias cat='bat'

alias weather='curl wttr.in/Warsaw'

# Templ
export TEMPL_FOLDER='/home/kubakorba/Templates/templ'


