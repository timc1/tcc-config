source ../.secrets
export PATH=/bin:/sbin:/usr/local/sbin:/usr/bin:/usr/local/bin:$PATH:/usr/local/mysql/bin

# Sets colors for Terminal
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

echo '''
    ________________________
   / "Welcome back, Tim!     \
   \  You the best"          /
     -----------------------
       \   ^___^
        \  (O O)\_________
           (___)\         )\/\
                ||------w |
                ||       ||
'''

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# Start the SSH agent
eval "$(ssh-agent -s)"
# Add the SSH key
ssh-add

alias mvim='open -a MacVim'
alias vi="mvim -v"
alias vim="mvim -v"
alias v="vim"
alias python="python3.7"
alias ss="python -m http.server 8888"
alias checkport='netstat -vanp tcp | grep'
alias ls='ls -GFh'
alias ll='ls -1a'
alias ..='cd ../'
alias sb='source ~/.bash_profile'
alias pg='echo "Pinging Google" && ping www.google.com'
# git aliases
alias gs="git status"
alias gp="git pull"
alias gf="git fetch"
alias gpush="git push"
alias gd="git diff"
alias ga="git add ."
alias gc="git commit -m"
#yarn aliases
alias ya="yarn add"
alias ys="yarn start"
alias yb="yarn build"
alias yd="yarn deploy"
alias yt="yarn test"
alias ytw="yarn test --watch"

# Custom functions
function killport (){
  lsof -i tcp:"$1" -t | xargs kill -9
  lsof -i tcp:"$1" -t 2>/dev/null >/dev/null || printf "killed processes on port %s\n" "$1"
}

# cd path alterations
CDPATH=.:$HOME:$HOME/Desktop:$HOME/Desktop/projects

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
