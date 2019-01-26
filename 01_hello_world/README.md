# Installing Dart
```
$ brew tap dart-lang/dart
$ brew install dart
```

# Upgrade Dart
```
$ brew upgrade dart
```

# Switch locally between installed dart releases 
```
$ brew switch dart 1.24.3
$ brew switch dart 2.1.0
```

# dart version check 
```
$ dart --version
```

# Dart SDK Structure 

```
karthikc@INCQPMAC010 2.1.0 $ pwd
/usr/local/Cellar/dart/2.1.0
karthikc@INCQPMAC010 2.1.0 $ ls -l
total 24
-rw-r--r--   1 karthikc  admin   579 Dec 15 20:59 INSTALL_RECEIPT.json
-rw-r--r--   1 karthikc  admin  2500 Dec 13  2017 LICENSE
-rw-r--r--   1 karthikc  admin   936 Dec 13  2017 README
drwxr-xr-x  10 karthikc  admin   320 Dec 15 20:58 bin
drwxr-xr-x   8 karthikc  admin   256 Jan 26 11:17 libexec
karthikc@INCQPMAC010 2.1.0 $ cd bin/
karthikc@INCQPMAC010 bin $ ls -l
total 56
lrwxr-xr-x  1 karthikc  admin  19 Dec 15 20:58 dart -> ../libexec/bin/dart
-r-xr-xr-x  1 karthikc  admin  73 Dec 15 20:58 dart2js
-r-xr-xr-x  1 karthikc  admin  78 Dec 15 20:58 dartanalyzer
-r-xr-xr-x  1 karthikc  admin  74 Dec 15 20:58 dartdevc
-r-xr-xr-x  1 karthikc  admin  74 Dec 15 20:58 dartdevk
-r-xr-xr-x  1 karthikc  admin  73 Dec 15 20:58 dartdoc
-r-xr-xr-x  1 karthikc  admin  73 Dec 15 20:58 dartfmt
-r-xr-xr-x  1 karthikc  admin  69 Dec 15 20:58 pub
```
### Dart Libraries 

* `dart`         - This executable is the dart standalone VM.
* `dart2js`      - The Dart-to-JavaScript compiler (used only for web development).
* `dartanalyzer` - The static analyzer.
* `dartdevc`     - The Dart development compiler (used only for web development).
* `dartdoc`      - The API documentation generator.
* `dartfmt`      - The Dart code formatter.
* `pub`          - The Dart package manager

# Executing dart app in command line using `dart`
```
$ dart hello_world.dart //It should probably contain the main method.
```

[Dart SDK Archives](https://www.dartlang.org/tools/sdk/archive)
