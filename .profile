export CLICOLOR=1

# define colors
C_DEFAULT="\[\033[m\]"
C_WHITE="\[\033[1m\]"
C_BLACK="\[\033[30m\]"
C_RED="\[\033[31m\]"
C_GREEN="\[\033[32m\]"
C_YELLOW="\[\033[33m\]"
C_BLUE="\[\033[34m\]"
C_PURPLE="\[\033[35m\]"
C_CYAN="\[\033[36m\]"
C_LIGHTGRAY="\[\033[37m\]"
C_DARKGRAY="\[\033[1;30m\]"
C_LIGHTRED="\[\033[1;31m\]"
C_LIGHTGREEN="\[\033[1;32m\]"
C_LIGHTYELLOW="\[\033[1;33m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTCYAN="\[\033[1;36m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_PURPLE="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_LIGHTGRAY="\[\033[47m\]"

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White

bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White

unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White

bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White

txtrst='\e[0m'    # Text Reset

export PS1="\n$C_LIGHTGREEN\u$C_DARKGRAY@$C_BLUE: $C_DARKGRAY: $C_LIGHTYELLOW\w\n$C_DARKGRAY\$$C_DEFAULT "

# Navigation
alias ll='ls -al'
alias search=grep
alias ..='cd ..'
alias ...='cd ../..'

# Set up alias to projects directory.
alias si='cd ~/Sites'

# Reloading
alias reload='source ~/.profile'
alias flushdns='dscacheutil -flushcache; echo Flushed!'

# Modifying
alias 777me='sudo chmod -R 777 .'
alias dsstore="find . -name '*.DS_Store' -type f -delete"

# Viewing
alias bashme='atom ~/.profile'
alias finder='open .'
alias newhost='sudo atom /usr/local/etc/nginx/ && atom /etc/hosts'

# Nginx
alias nginx.start='sudo nginx'
alias nginx.stop='sudo nginx -s stop'
alias nginx.restart='nginx.stop && nginx.start'

# Apache
alias apache_start='sudo apachectl start'
alias apache_stop='sudo apachectl stop'
alias apache_restart='sudo apachectl restart'
alias apache_status='sudo apachectl status'
alias apache_fullstatus='sudo apachectl fullstatus'
alias apache_newhost='sudo atom /etc/apache2/extra/httpd-vhosts.conf; sudo atom /etc/hosts'
alias apache_conf="sudo atom /etc/apache2/httpd.conf"

# MySQL
alias mysql_start='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysql_stop='sudo /usr/local/mysql/support-files/mysql.server stop'
alias mysql_restart='sudo /usr/local/mysql/support-files/mysql.server restart'


# Functions
function cd() {
  builtin cd "$@" && ls;
}

# Style the prompt
print_before_the_prompt () {
  printf "\n $txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(parse_git_branch)"
}

# Display current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT_COMMAND=print_before_the_prompt
PS1='-> '
