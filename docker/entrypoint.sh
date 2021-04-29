#!/bin/bash

if [[ "$ENV_CONFIG" == "1" ]]; then
	mkdir -p ./config/OneBot ./config/Console
	cat ./docker/templates/OneBot.yml | envsubst > ./config/OneBot/settings.yml
	cat ./docker/templates/AutoLogin.yml | envsubst > ./config/Console/AutoLogin.yml
fi

"$@"
