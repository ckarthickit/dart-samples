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

##	Library Directives 

1.	`export` directive 				 - Use to "explicitly" expose a dart file for public use.
2.	`part` and `part of`  directives - allows to split a library into multiple dart files  (Avoid using part, create mini-libraries instead).<br/>
										With part/part of you can split one library into several files and <span style="color:red">private members are accessible for all code within these files</span>
3.  `library` directive 			 - To include any library-level documentation in the generated docs, you must specify the library directive.m