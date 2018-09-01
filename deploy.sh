#!/usr/bin/env bash

# baixa a ultima versao do codigo branch master
# git fetch origin
reslog=$(git --version )
pathFile=/var/www/html
envFile=/var/.env
nameProject=vyper
temp=_tmp
if [[ "${reslog}" != "" ]] ; then

	git clone https://kaleb14587:KpclwAy07eb@github.com/kaleb14587/vyper-backend.git $pathFile/$nameProject$temp
	
		dt=$(date  "+%Y%m%d_%H%M%S");
		
	echo "composer update "
	composer update --working-dir=$pathFile/$nameProject$temp
	
	echo "Gera o link simbolico no novo projeto"
	ln -s $pathFile/$nameProject$temp/storage /var/storage
	
	echo "versiona o antigo que esta em producao"
	mv $pathFile/$nameProject $pathFile/$nameProject$dt
	
	echo "substitui o antigo pelo novo projeto"
	mv $pathFile/$nameProject$temp $pathFile/$nameProject
	ln -s $pathFile/$nameProject/.env $envFile
	echo "migrando as atualizações de banco"
#	php $pathFile/novo-sistema/artisan migrate
	
else 
	echo "sem git instalado";
fi
#  git merge origin/master # completing the pull

#https://gitlab.com/project/project/-/archive/master/project-master.tar.gz
