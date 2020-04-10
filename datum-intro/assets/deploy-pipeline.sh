echo "Creating a pipeline"

sleep 20

pachctl create repo cats
pachctl put file -r cats@master -f Cats1
pachctl put file -r cats@master -f Cats2
pachctl create pipeline -f cats.json

echo "The Pipeline is created."
