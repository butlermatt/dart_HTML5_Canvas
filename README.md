HTML5 Canvas
============

A Dart port of the HTML5 Canvas (2nd Edition) Samples. The samples contained
here are all based entirely off of the works: HTML5 Canvas, Second Edition
by Steve Fulton and Jeff Fulton (O'Reilly). Copyright 2013 8bitrocket Studios
ISBN: 978-1-449-33498-7. The samples are reproduced under the MIT License
(See included LICENSE file) with permission from O’Reilly Media, Inc. 
Copyright 2013.

About The Port
--------------

The aim of this project is to provide Dart versions of the examples used in
the *HTML5 Canvas (2nd Edition)*. Where possible I've remained true to the
examples rather than implementing any optimizations. However I have tried to 
use common Dart idioms whenever I can. The original goal of the book is to
teach readers the HTML5 Canvas and related APIs, not game programming
optimizations.
(Also see Bob Nystrom's book in progress: [Game Programming Patterns](http://gameprogrammingpatterns.com/))

The examples are located in the web/ directory per Pub's 
[Package Layout Conventions](http://pub.dartlang.org/doc/package-layout.html).
Within that directory, each chapter is broken down into its own directory.
In chapter 1, I have omitted the first couple of samples as they do not 
pertain directly to Dart. I have included the base template used for many
of the samples.

I varied from the book samples by keeping the HTML, stylesheets and Dart code
in their own separate files to more clearly display the specific code.
Additionally I find this helps conceptionally when compiling to JavaScript.

While the source is heavily commented, I **highly** recommend that you read 
[HTML5 Canvas, 2nd Edition](http://shop.oreilly.com/product/0636920026266.do) while
following the samples. They have also generously made this book available for 
[reading online](http://chimera.labs.oreilly.com/books/1234000001654/index.html).

The Examples
------------
* [Chapter 1](https://github.com/butlermatt/dart_HTML5_Canvas/tree/master/web/ch1)
    * Example 3 - Your First Canvas Application \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch1/ch1ex3.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch1/ch1ex3.dart)\]
    * Example 4 - Guess The Letter Game \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch1/ch1ex4.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch1/ch1ex4.dart)\]
    * Example 5 - Hello World Animated \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch1/ch1ex5.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch1/ch1ex5.dart)\]
    * Example 6 - Canvas Sub DOM Example \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch1/ch1ex6.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch1/ch1ex6.dart)\]
* [Chapter 2](https://github.com/butlermatt/dart_HTML5_Canvas/tree/master/web/ch2)
    * Example 1 - Basic Rectangles \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex1.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex1.dart)\]
    * Example 2 - Basic Paths \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex2.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex2.dart)\]
    * Example 3 - Basic Line Joins \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex3.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex3.dart)\]
    * Example 4 - Arcs, Curves, and beziers \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex4.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex4.dart)\]
    * Example 5 - Clipping Regions \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex5.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex5.dart)\]
    * Example 6 - Compositing and Global Alpha \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex6.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex6.dart)\]
    * Example 7 - Rotation Transformation #1 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex7.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex7.dart)\]
    * Example 8 - Rotation Transformation #2 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex8.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex8.dart)\]
    * Example 9 - Rotation Transformation #3 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex9.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex9.dart)\]
    * Example 10 - Rotation Transformation Multi Example \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex10.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex10.dart)\]
    * Example 11 - Scale Transformation #1 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex11.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex11.dart)\]
    * Example 12 - Combined Scale and Rotation \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex12.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex12.dart)\]
    * Example 13 - Combined Scale and Rotation #2 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex13.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex13.dart)\]
    * Example 14 - Simple Linear Gradients \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex14.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex14.dart)\]
    * Example 15 - Simple Linear Gradients #2 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex15.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex15.dart)\]
    * Example 16 - Simple Linear Gradients #3 - Horizontal Stroke Rects \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex16.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex16.dart)\]
    * Example 17 - Simple Linear Gradients #4 - Complex Shape \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex17.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex17.dart)\]
    * Example 18 - Simple Linear Gradients #5 - Vertical Complex Shape \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex18.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex18.dart)\]
    * Example 19 - Simple Linear Gradients #6 - Vertical Stroke Shape \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex19.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex19.dart)\]
    * Example 20 - Simple Diagonal Gradient \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex20.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex20.dart)\]
    * Example 21 - Simple Radial Gradient #1 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex21.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex21.dart)\]
    * Example 22 - Simple Radial Gradient #2 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex22.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex22.dart)\]
    * Example 23 - Simple Radial Gradient #3 - Arc \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex23.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex23.dart)\]
    * Example 24 - Simple Radial Gradient #4 - Arc Stroke \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex24.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex24.dart)\]
    * Example 25 - Fill Pattern Example #1 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex25.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex25.dart)\]
    * Example 26 - Fill Pattern Example #2 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex26.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex26.dart)\]
    * Example 27 - Shadow Examples \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex27.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex27.dart)\]
    * Example 28 - Animating a Path \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex28.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch2/ch2ex28.dart)\]
* [Chapter 3](https://github.com/butlermatt/dart_HTML5_Canvas/tree/master/web/ch3)
    * Example 1 - Text Arranger Version 1.0 \[[.html](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch3/ch3ex1.html)\]
\[[.dart](https://github.com/butlermatt/dart_HTML5_Canvas/blob/master/web/ch3/ch3ex1.dart)\]
