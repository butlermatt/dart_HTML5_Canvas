library ch2.ex8;

import 'dart:html';
import 'dart:math' as math;

// The dart print() command will automatically print to the console
// and shouldn't throw an exception so no need to worry about creating
// our own debugger. For more complicated logging the logger package exists.

// Since dart supports class inheritance and library namespaces
// we don't need to keep our methods/properties in a local scope.
class CanvasApp {
  CanvasElement theCanvas;
  CanvasRenderingContext2D context;
  
  CanvasApp() {
    // Initialize the canvas and context
    theCanvas = document.querySelector('#canvas');
    context = theCanvas.getContext('2d');
  }
  
  void drawScreen() {
    // Content goes here.
    
    // Draw a small black square
    context..fillStyle = 'black'
        ..fillRect(20, 20, 25, 25);
    
    // Draw a red square and rotate it
    var angleInRadians = 45 * (math.PI / 180);
    context..setTransform(1, 0, 0, 1, 0, 0) // Required before rotating
      ..rotate(angleInRadians)  // Rotate before drawing
      ..fillStyle = 'red'
      ..fillRect(100, 100, 50, 50);
        
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}