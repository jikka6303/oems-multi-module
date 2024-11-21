IFS='-'
for path in app-commons auth-service resource-service
do
	cd "$path"
	echo "inside -> $path"
	mvn clean install -DskipTests
	if test -f Dockerfile; then
		echo "building docker image"
		docker build . -t  "food-delivery-system/${path}:latest"
	fi
	cd ..
done
