rm -rf ./static
mkdir "static"
cd web_app || exit
flutter build web --release  --base-href="/app/"
mv  ./build/web/* ./../static