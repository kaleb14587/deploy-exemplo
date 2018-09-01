#!/usr/bin/env bash

# baixa a ultima versao do codigo branch master
# git fetch origin
reslog=$(git --version )
pathFile=/var/www/html/
envFile=/usr/kaleb/.env
if [[ "${reslog}" != "" ]] ; then

	git clone https://kaleb14587:KpclwAy07eb@github.com/kaleb14587/vyper-backend.git $pathFile/vyper_tmp
	
		dt=$(date  "+%Y%m%d_%H%M%S");
		

	echo "Gera o link simbolico no novo projeto"
	#ln -s $pathFile/novo-sistema_tmp/storage /var/storage
	echo "versiona o antigo que esta em producao"
	mv $pathFile/vyper $pathFile/vyper_$dt
	echo "substitui o antigo pelo novo projeto"
	mv $pathFile/vyper_tmp $pathFile/vyper
	echo "migrando as atualizações de banco"
#	php $pathFile/novo-sistema/artisan migrate
	
else 
	echo "sem git instalado";
fi
#  git merge origin/master # completing the pull

#https://gitlab.com/project/project/-/archive/master/project-master.tar.gz
