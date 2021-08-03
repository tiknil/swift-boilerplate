mkdir -p Boilerplate/Resources/Locale/en.lproj/
mkdir -p Boilerplate/Resources/Locale/it.lproj/

twine generate-localization-file Localizations/twine.txt Boilerplate/Resources/Locale/en.lproj/Localizable.strings --lang en --format apple;
twine generate-localization-file Localizations/twine.txt Boilerplate/Resources/Locale/it.lproj/Localizable.strings --lang it --format apple;