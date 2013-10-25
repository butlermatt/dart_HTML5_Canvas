library ch2.ex2;

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
    
    context..strokeStyle = 'black' // Stroke black line (#000000)
        ..lineWidth = 10 // Stroke width is 10px
        ..lineCap = 'square' // Line ends are squared (vs butt and round)
        ..beginPath() // Start a path
        ..moveTo(20, 0) // move pen to 20, 0
        ..lineTo(100, 0) // draw a line from (20, 0) to (100, 0)
        ..stroke() // paint the line
        ..closePath(); // terminate the path.
    
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}