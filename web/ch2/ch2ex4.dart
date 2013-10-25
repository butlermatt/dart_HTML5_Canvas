library ch2.ex4;

import 'dart:html';

import 'dart:math' as math; // Required for PI

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
    
    context..strokeStyle = 'black'
        ..lineWidth = 5
        ..beginPath()
        // Full circle. In Dart anticlockwise is optional (defaults to false)
        ..arc(100, 100, 20, (math.PI/180) * 0, (math.PI/180) * 360)
        ..stroke()
        ..closePath();
    
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}