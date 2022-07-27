lint: 
	docker run --rm -t -v `pwd`/integration/:/data/integration/ auth0/marketplace-integration-tools npm run integration:lint

test: 
	docker run --rm -t -v `pwd`/integration/:/data/integration/ auth0/marketplace-integration-tools npm run test:social-connection

zip: 
	zip -r integration-social-connection.zip integration media

deploy_init:
	docker run --rm -it -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0/marketplace-integration-tools bash deploy-scripts/init.sh

deploy_get_token:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0/marketplace-integration-tools bash deploy-scripts/get-token.sh

deploy_create:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0/marketplace-integration-tools bash deploy-scripts/social-connection-create.sh

deploy_get:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0/marketplace-integration-tools bash deploy-scripts/social-connection-get.sh

deploy_get_all:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0/marketplace-integration-tools bash deploy-scripts/social-connection-get-all.sh

deploy_update:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0/marketplace-integration-tools bash deploy-scripts/social-connection-update.sh

deploy_delete:
	docker run --rm -t -v `pwd`/integration/:/data/integration/ -v `pwd`/deploy:/data/deploy auth0/marketplace-integration-tools bash deploy-scripts/social-connection-delete.sh