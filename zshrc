#{{{Opciones generales

#espera 10 segundos si vamos a borrar todo
setopt RM_STAR_WAIT

#no hay beeps en los errores
unsetopt beep nomatch

zstyle :compinstall filename '/home/felipe/.zshrc'

#Vi mode
bindkey -v

#Case insensitive globbing
setopt NO_CASE_GLOB



#}}}

#{{{Historial
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory notify

#evitamos que se guarden los duplicados
setopt hist_ignore_all_dups
#}}}



#{{{Autocompletado
autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

#corregimos los errores al escribir comandos
setopt correctall 

#Completado mas rapido
zstyle ':completion::complete:*' use-cache 1

#MENU EN EL COMPLETADO!
zstyle ':completion:*:default' menu 'select=0'


#}}


#Activamos los colores
autoload -U colors && colors


#{{{ Editor por defecto es vim, si es que esta instalado
if [[ -x $(which vim) ]]
then
	export EDITOR="vim"
	export USE_EDITOR=$EDITOR
	export VISUAL=$EDITOR
fi
#}}}

#{{{ Activamos el uso de colores en ls
if [[ "$TERM" != "dumb" ]]; then
	if [[ -x `which dircolors` ]]; then
		eval `dircolors -b`
		alias 'ls=ls --color=auto'
	fi
fi
#}}}

#{{{ Muestra el modo en vi mode
function zle-line-init zle-keymap-select {
RPS1="${${KEYMAP/vicmd/(N)}/(main|viins)/(I)}"
RPS2=$RPS1
zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
#}}}



#{{{PROMPT
#Debemos poner los colores entre %{ COLOR %} para no tener problemas con el
#completado de los comandos

prompt_gentoo_setup () {
	prompt_gentoo_prompt=${1:-'blue'}
	prompt_gentoo_user=${2:-'green'}
	prompt_gentoo_root=${3:-'red'}

	if [ "$USER" = 'root' ]
	then
		base_prompt="%B%F{$prompt_gentoo_root}%m:%k "
	else
		base_prompt="%B%F{$prompt_gentoo_user}%n@%m:%k "
	fi
	post_prompt="%b%f%k"

	#setopt noxtrace localoptions

	path_prompt="%B%F{$prompt_gentoo_prompt}%1~"
	PS1="$base_prompt$path_prompt %# $post_prompt"
	PS2="$base_prompt$path_prompt %_> $post_prompt"
	PS3="$base_prompt$path_prompt ?# $post_prompt"
}

prompt_gentoo_setup "$@"


#}}}

#{{{ ALIAS

alias youtube_baja='youtube-dl -t -f 5 -c'
alias youtube_normal='youtube-dl -f 34 -t -c'

#}}}

