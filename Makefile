# defined from https://wiremock.org/assets/js/wiremock-admin-api.json
# usage:
# 	make clean api
#   cp api/target/wiremock-admin-api-*.jar /path/to/libs
# Follow api/README.md for more details

PHONY: clean api package
verify:
	openapi-generator-cli version || (echo "openapi-generator-cli not found. Install it from https://openapi-generator.tech/docs/installation" && exit 1)

api: verify
	openapi-generator-cli generate -g java -c config.yaml -o api -i wiremock-admin-api.yaml

package: api
	cd api && mvn clean package

clean:
	rm -rf api