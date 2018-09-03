#!/usr/bin/env bash

# baixa a ultima versao do codigo branch master
# git fetch origin
reslog=$(git --version )
pathFile=/var/www/html
envFile=/var/.env
nameProject=vyper
temp=_tmp
repository=https://git/repo/repo.git
if [[ "${reslog}" != "" ]] ; then

	git clone $repository $pathFile/$nameProject$temp
	
		dt=$(date  "+%Y%m%d_%H%M%S");
		
	echo "composer update "
	composer update --working-dir=$pathFile/$nameProject$temp
	
	
	echo "versiona o antigo que esta em producao"
	mv $pathFile/$nameProject $pathFile/$nameProject$dt
	
	echo "substitui o antigo pelo novo projeto"
	mv $pathFile/$nameProject$temp $pathFile/$nameProject
	# arquivo env fica fora do projeto
	echo "link do env"
	ln -s  $envFile $pathFile/$nameProject/.env

	echo "Gera o link simbolico no novo projeto do storage"
	ln -s  /var/storage/ $pathFile/$nameProject/storage 

	echo "migrando as atualizações de banco"
	sudo php $pathFile/$nameProject/artisan migrate
	sudo php $pathFile/$nameProject/artisan cache:clear
	echo "Publish any publishable assets from vendor packages"
	sudo php $pathFile/$nameProject/artisan vendor:publish
	sudo php $pathFile/$nameProject/artisan key:generate 
	#sudo php $pathFile/$nameProject/artisan passport:install
#	chmod -R 777 /var/www/html/vyper/storage/

else 
	echo "sem git instalado";
fi
#  git merge origin/master # completing the pull


