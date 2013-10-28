library ch2.ex6;

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
    
    // Draw a big box on the screen
    context..fillStyle = 'black'
        ..fillRect(10, 10, 200, 200);
    
    // Leave default global compiste operation as it is
    // Draw a red square
    context..fillStyle = 'red'
        ..fillRect(1, 1, 50, 50);
    
    // Now set composite to source-over
    context..globalCompositeOperation = 'source-over'
        ..fillRect(60, 1, 50, 50);
    
    // Now destination-atop
    // Comment this out because it breaks things otherwise
//    context..globalCompositeOperation = 'destination-atop'
//        ..fillRect(1, 60, 50, 50);
    
    // Set global Alpha and source-atop
    context..globalAlpha = 0.5
        ..globalCompositeOperation = 'source-atop'
        ..fillRect(60, 60, 50, 50);
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}