## Concatenating Strings

### Problem

You want to know how to concatenate strings in Dart. You tried using `+`, but
that resulted in an error.

### Solution

Use adjacent string literals:

	'Dart'  is' ' fun!'; // 'Dart is fun!'
	
### Discussion

Adjacent literals also work over multiple lines:

	'Dart'
	'is'
	fun!; // 'Dart is fun!'

They also work when using multiline strings:

	'''Peanut
	butter'''
	'''and
	jelly'''; // 'Peanut\nbutter and\njelly'
	
And you can concatenate adjacent single line literals with multiline strings:

	'Peanut ' 'butter'
	''' and
	jelly'''; // 'Peanut butter and\n jelly'

#### Alternatives to adjacent string literals

Use `concat()`:

	'Dewey'.concat(' Cheatem').concat(' and').concat( ' Howe'); // 'Dewey Cheatem and Howe'

Invoking a long chain of `concat()`s can be expensive (`concat()` creates a
new string every time it is invoked): if you need to incrementally 
build up a long string, use a StringBuffer instead (see below).

Use `join()` to combine a sequence of strings:

	['Dewey', 'Cheatem', 'and', 'Howe'].join(' '); // 'Dewey Cheatem and Howe'

You can also use string interpolation (see below).

## Interpolating expressions inside strings

### Problem

You want to create strings that contain Dart expressions and identifiers.

### Solution

You can put the value of an expression inside a string by using ${expression}.

    var favFood = 'sushi';
    'I love ${favFood.toUpperCase()}'; // 'I love SUSHI'

You can skip the {} if the expression is an identifier:

    'I love $favFood'; // 'I love sushi'
      
### Discussion

An interpolated string �string ${expression}� is equivalent to the
concatenation of the strings �string' and expression.toString():

	var four = 4;
    'The $four seasons'; // 'The 4 seasons'
	
The code above is equivalent to the following:

	'The '.concat(4.toString()).concat(' seasons'); // 'The 4 seasons'
	
You should consider implementing a `toString()` method for user-defined
objects. Here's what happens if you don't:

	class Point {
	  num x, y;
	  Point(this.x, this.y);
	}
	
	var point = new Point(3, 4);
    'Point: $point'; // "Point: Instance of 'Point'"

Probably not what you wanted. Here is the same example with an explicit
`toString()`:

	class Point {
      ...
	  String toString() => "x: $x, y: $y";
	}
	
    'Point: $point'; // 'Point: x: 3, y: 4'

Interpolations are not evaluated within raw strings:

	r'$favFood'; // '$favFood'
	
	
## Incrementally building a string efficiently

### Problem

You want to combine string fragments in an efficient way. 

### Solution

Use a StringBuffer to programmatically generate a string. A StringBuffer 
collects the string fragments, but does not generate a new string until
`toString()` is called:

	var sb = new StringBuffer();
    sb.write("John, ");
    sb.write("Paul, ");
    sb.write("George, ");
    sb.write("and Ringo");
    sb.toString(); // "John, Paul, George, and Ringo"
    
### Discussion

In addition to `write()`, the StringBuffer class provides methods to write a
list of strings (`writeAll()`), write a numerical character code
(`writeCharCode()`), write with an added newline ('writeln()`), and more. Here
is a simple example:

    var sb = new StringBuffer();
    sb.writeln("The Beatles:");
    sb.writeAll(['John, ', 'Paul, ', 'George, and Ringo']);
    sb.writeCharCode(33); // charCode for '!'.
    sb.toString(); // 'The Beatles:\nJohn, Paul, George, and Ringo!' 

A StringBuffer represents a more efficient way of combining strings than
`concat()`.  See the "Concatenating Strings" recipe for a description of `concat()`. 