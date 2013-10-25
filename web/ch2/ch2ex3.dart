library ch2.ex3;

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
    
    // Round end. Bevel join, at top left of canvas
    context..strokeStyle = 'black'
        ..lineWidth = 10
        ..lineJoin = 'bevel'
        ..lineCap = 'round'
        ..beginPath()
        ..moveTo(0, 0)
        ..lineTo(25, 0)
        ..lineTo(25, 25)
        ..stroke()
        ..closePath();
    
    // Round end, Bevel join, not at top or left of canvas
    context..beginPath()
        ..moveTo(10, 50)
        ..lineTo(35, 50)
        ..lineTo(35, 75)
        ..stroke()
        ..closePath();
    
    // Flat end, Round Join, not at top or left of canvas
    context..lineJoin = 'round'
        ..lineCap = 'butt'
        ..beginPath()
        ..moveTo(10, 100)
        ..lineTo(35, 100)
        ..lineTo(35, 125)
        ..stroke()
        ..closePath();
    
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}