#!/bin/bash
# It should be obvious that this will overwrite your current bashrc file, so back up if you need to before running this.

if [[ -z $1 ]]; then
        echo -e 'Dash bash install script.\n\nOptions:\n-i : interactive mode.\n-b : Install only bashrc.\n-n : Install only nanorc.\n-a : Install all.\n\nExample: ./install.sh -i';
        exit 1;
fi

if [[ $1 == -i ]]; then
	read -p "Install bashrc? [y/N]: " OPT;
	[[ $OPT == y ]] && cp ./dashbashrc.sh ~/.bashrc && echo '...Done!';
	read -p "Install nanorc? [y/N]: " OPT;
	[[ $OPT == y ]] && cp ./dashnano.sh ~/.nanorc && echo '...Done!';
fi

if [[ $1 == -b ]]; then
	cp ./dashbashrc.sh ~/.bashrc && echo '...Done!';
fi

if [[ $1 == -n ]]; then
	cp ./dashnano.sh ~/.nanorc && echo '...Done!';
fi

if [[ $1 == -a ]]; then
	cp ./dashbashrc.sh ~/.bashrc && echo '...Done!';
        cp ./dashnano.sh ~/.nanorc && echo '...Done!';
fi


exit 0;
