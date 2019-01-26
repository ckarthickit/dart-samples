# Dart Packages 
* In Dart eco-system `Libraries` are created and distributed as `packages`.


## 2 types of Dart packages
1. `Application Package`
	- Usually meant to be run directly either in `command-line` or in a `browser`.
	- Might have other dependencies but `never depended on` themseleves.
	- Should check their lockiles <span style="color:blue">(pubspec.lock)</span> into source-control, so that everyone working
	  on the application has consistent set of dependencies

2. `Library Package`
	- A package that other packages will depend on.
	- Might also include `scripts` that will be run directly.
	- Should not check their lockfile into source control since they should support a range of dependency versions.

## Basic structure of a Library package

![alt text](assets/packages_base_structure.png "Basic structure of a pacakge")
```
root directory ------------- lib ----- file.dart
					|
					|
	 				-------- pubspec.yaml
```
   - `pubspec.yaml` - 	Specification about the application (or) library and it's dependencies.  				
   - `lib` folder - Contains the library code. 