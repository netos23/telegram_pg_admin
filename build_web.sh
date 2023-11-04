rm -rf ./static
mkdir "static"
cd web_app || exit
flutter build web --release
mv  ./build/web/* ./../static