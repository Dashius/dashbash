##########################
# Dash's little bashrc	 #
##########################

###################
## Shell prompt: ##
###################
PS1="[\t][\W] \e[0;34m\u\e[m@\h -> "

###################
## Greeting      ##
###################
cd
echo Welcome, $(tput setaf 4)$(echo $USER)$(tput sgr0).
echo Today is $(date +"%A"), $(date +"%B") $(date +"%d") $(date +"%Y").

###################
## Functions     ##
###################
## Displays jsons from web-based APIs nicely:
jcurl(){ 
	local DATA=$(curl $1);
	 echo $DATA | python -m json.tool;
	}

## A simple little calculator:
calc(){
	echo $1 | bc -l;
}

# In case chromium cache's stuff we don't want it to (I.E: Refuse to put windows where we want):
clearmeh(){
        rm -rf /home/$USER/.meh/*;
}

## Open chrome apps in a little tab-less window:
## Bear in mind: Window sizes set to fit my monitor. Your mileage may vary.
tinychromeapp(){
	chromium --user-data-dir=/home/$USER/.meh --window-position=$2 --window-size=400,315 --app=$1 &
	# Comment this if you don't want to re-type passwords at the expense of having to manually move windows:
	clearmeh
}

## Opens hack.chat with a specific channel, position and size:
hchat(){
	local SITE=http://hack.chat?$1;
	local POSITION='1500,655'
	local SIZE='400,315'
	tinychromeapp $SITE $POSITION $SIZE;
}

#You must be signed into messenger.com (otherwise it is the same as previous func):
fbc(){
	local SITE=http://messenger.com;
        local POSITION='1500,655'
        local SIZE='400,315'
        tinychromeapp $SITE $POSITION $SIZE;
}

# Amazon Music Player (requires log-in):
azm(){
        local SITE="https://www.amazon.com/gp/dmusic/cloudplayer/player?ie=UTF8#genres";
	local POSITION='1500,265'
        local SIZE='400,80'
        tinychromeapp $SITE $POSITION $SIZE;
}

# Run a socks5 proxied chromium window. Additionally, you can pull curl calls via --socks5-hostname
proxify(){
	ssh -f -N -D $1 $2 -p $3;
	chromium --proxy-server="socks5://localhost:$1" wtfismyip.com;
}

# Eclipse displays poorly without this on my current setup.
fixEclipse(){
	export SWT_GTK3=0;
	eclipse &
}

encFile(){
	openssl enc -in  $1 -out $2 -e -aes256 -pass "pass:$(echo $3 | md5sum)";
}

decFile(){
	openssl enc -in $1 -out $2 -d -aes256 -pass "pass:$(echo $3 | md5sum)";
}

secText(){
	cat $1 &> /dev/null;
	if [ $(echo $?) -ne $(echo 0) ]; then
		nano $1;
		encFile $1 .$1.e $2;
		rm -rf $1;
	else
		decFile $1 $1.d $2 &> /dev/null;
		if [ $(echo $?) -eq $(echo 0) ]; then
			rm -rf $1;
			nano $1.d;
			encFile $1.d $1 $2;
			rm -rf $1.d;
		else
			echo 'Nice try. Wrong pass.';
		fi
	fi
	
}

###################
## Aliases       ##
###################
alias elpeso="jcurl 'http://api.fixer.io/latest?base=USD&symbols=MXN'"
alias wanip="jcurl http://wtfismyip.com/json"
# Mount a network directory. $1 is what, $2 is where (locally). IE: $1=192.168.X.X/Public $2=/mnt
alias mtcifs='sudo mount -t cifs //$1 $2 -o rw'
# Must have installed youtube-dl:
alias ymp3='youtube-dl --extract-audio --audio-format mp3 -l $1'

