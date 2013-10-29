library ch2.ex20;

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
    
    // Create a gradient that starts at 0,0 and extends along the x axis
    var gr = context.createLinearGradient(0, 0, 100, 100);
    
    // Add the color stops.
    gr..addColorStop(0, 'rgb(255, 0, 0)')
        ..addColorStop(0.5, 'rgb(0, 255, 0)')
        ..addColorStop(1, 'rgb(255, 0, 0)');
    
    // Use the gradient for the strokeStyle
    context..fillStyle = gr
        ..beginPath() // Not needed
        ..moveTo(0, 0) // Not needed
        ..fillRect(0, 0, 100, 100)
        ..closePath(); // End path. Not needed
    // The above 'not needed' commented lines are included in the original
    // source examples but should not be required for drawing the simple
    // rectangle since there are no paths being created or used.
    // See ch2ex1.dart for more rectangle examples.
        
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}