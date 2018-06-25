# Needed for Travis - it won't like the version regex check otherwise
SHELL=/bin/bash

setup:
	@bundle install

serve:
	@jekyll serve

swagger-doc:
	@java -jar ./scripts/swagger2markup-cli-1.3.3.jar convert \
	 -i https://raw.githubusercontent.com/kiali/kiali/master/swagger.json \
	 -d ./pages/api/ \
	 -c ./scripts/config.properties