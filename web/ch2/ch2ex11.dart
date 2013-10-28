library ch2.ex11;

import 'dart:html';

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
    
    // Draw a red square and rotate it
    var x = 100;
    var y = 100;
    var height = 50;
    var width = 50;
    
    context..setTransform(1, 0, 0, 1, 0, 0) // Required before rotating
      ..translate(x + (width/2), y + (height/2)) // Change our origin point.
      // Try commenting out the following line and running again.
      ..scale(2, 2)  // Scale before drawing
      ..fillStyle = 'red'
      ..fillRect(-width/2, -height/2, width, height);
    
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}