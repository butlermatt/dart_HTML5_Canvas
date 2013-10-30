library ch2.ex22;

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
    
    // Create a gradient that starts at 50,50 with a radius of 25
    // and extends to second circle at 100,100 with radius of 100
    var gr = context.createRadialGradient(50, 50, 25, 100, 100, 100);
    
    // Add the color stops.
    gr..addColorStop(0, 'rgb(255, 0, 0)')
        ..addColorStop(0.5, 'rgb(0, 255, 0)')
        ..addColorStop(1, 'rgb(255, 0, 0)');
    
    // Use the gradient for the strokeStyle
    context..fillStyle = gr
        ..fillRect(0, 0, 200, 200);
        
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}