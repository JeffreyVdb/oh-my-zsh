# Artisan basic command completion
_artisan_get_command_list () {
    php artisan --no-ansi | sed "1,/Available commands:/d" | awk '/^ [a-z]+/ { print $1 }'
}

_artisan () {
    if [ -f artisan ]; then
        compadd `_artisan_get_command_list`
    fi
}

compdef _artisan artisan
compdef _artisan la

#Alias
alias la='php artisan'

alias ladump='php artisan dump-autoload'
alias lacache='php artisan cache:clear'
alias laroutes='php artisan routes'
