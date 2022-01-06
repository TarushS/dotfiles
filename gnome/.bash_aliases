# VPN
#alias vpn="warp-cli connect"
#alias vpn-off="warp-cli disconnect"
#alias vpn-test="curl https://www.cloudflare.com/cdn-cgi/trace/"
alias vpn="protonvpn-cli c"
alias vpn-off="protonvpn-cli d"
alias vpn-test="protonvpn-cli s"

# Dev
alias venv="source ~/env/bin/activate"
server() {
	python3 -m http.server $1
}
complete -W "9001 8080" server
alias vps="ssh tarush@139.59.46.128"
alias server-php="php -t . -S localhost:9001"
alias pycharm="/opt/pycharm-2021.2.3/bin/pycharm.sh"
alias portcheck="sudo netstat -tulpn | grep LISTEN"
alias addkey="sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys $1"

# Misc
alias kys='shutdown'
alias batteryinfo='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias xxclip='xclip -selection clipboard'
alias fzf='fzf | xclip -sel clip'
alias rungpu='__NVPRIME_RENDER_OFFLOAD=1 __GLX_VENDER_LIBRARY_NAME=nvidia'
alias afk="venv; cd ~/tools; python afk.py"

d() {
    $* & disown
}
complete -A command d

export PATH="~/tools/nvui/bin:$PATH"
#export FONTCONFIG_PATH=~/.local/share/fonts/NerdFonts
