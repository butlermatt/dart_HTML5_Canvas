library ch2.ex1;

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
    
    context..fillStyle = '#000000' // black filled rectangle
        ..strokeStyle = '#ff00ff' // Magenta stroke rectangle 
        ..lineWidth = 2 // Stroke line width is 2
        ..fillRect(10, 10, 40, 40) // fill black rectangle
        ..strokeRect(0, 0, 60, 60) // Stroke Magenta rectangle
        ..clearRect(20, 20, 20, 20); // Clear small rectangle
    
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}