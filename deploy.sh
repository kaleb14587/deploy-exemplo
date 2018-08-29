#!/usr/bin/env bash

# baixa a ultima versao do codigo branch master
# git fetch origin
reslog=$(git --version )
pathFile=/home/nitro/projetos
envFile=/home/nitro/.env
if [[ "${reslog}" != "" ]] ; then

	wget https://gitlab.com/path/project/-/archive/master/project-master.tar.gz $pathFile/novo-sistema_tmp
	
		dt=$(date  "+%Y%m%d_%H%M%S");
		

	echo "Gera o link simbolico no novo projeto"
	#ln -s $pathFile/novo-sistema_tmp/storage /home/nitro/storage
	echo "versiona o antigo que esta em producao"
	mv $pathFile/novo-sistema $pathFile/novo-sistema_$dt
	echo "substitui o antigo pelo novo projeto"
	mv $pathFile/novo-sistema_tmp $pathFile/novo-sistema
	echo "migrando as atualizações de banco"
#	php $pathFile/novo-sistema/artisan migrate
	
else 
	echo "sem git instalado";
fi
#  git merge origin/master # completing the pull

https://gitlab.com/project/project/-/archive/master/project-master.tar.gz
