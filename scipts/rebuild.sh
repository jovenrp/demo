
echo 'Running rebuild.sh'

flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart plugins/i18n_generator/lib/main.dart --output lib/generated/i18n_lookup.generated.dart

flutter format lib