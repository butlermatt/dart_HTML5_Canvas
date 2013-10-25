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
    
    // Arc examples
    context..strokeStyle = 'black'
        ..lineWidth = 5
        ..beginPath()
        // Full circle. In Dart anticlockwise is optional (defaults to false)
        ..arc(50, 100, 20, (math.PI/180) * 0, (math.PI/180) * 360)
        ..stroke()
        ..closePath()
        // A quarter circle arc
        ..beginPath()
        ..arc(50, 200, 20, (math.PI/180) * 0, (math.PI/180) * 90)
        ..stroke()
        ..closePath()
        // A Three-quarter circle by using anticlockwise
        ..beginPath()
        ..arc(50, 300, 20, (math.PI/180) * 0, (math.PI/180) * 90, true)
        ..stroke()
        ..closePath();
    
    // arcTo Examples
    context..strokeStyle = 'red'
        ..beginPath()
        ..moveTo(100, 0)
        ..lineTo(200, 200)
        ..arcTo(450, 350, 300, 100, 20)
        ..stroke()
        ..closePath();
    
    // Quadratic Curves
    context..strokeStyle = 'blue'
        ..beginPath()
        ..moveTo(300, 0)
        ..quadraticCurveTo(400, 25, 300, 50)
        ..stroke()
        ..closePath();
    
    // Bezier Curves
    context..beginPath()
        ..moveTo(300, 100)
        ..bezierCurveTo(150, 225, 450, 275, 300, 400)
        ..stroke()
        ..closePath();
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}