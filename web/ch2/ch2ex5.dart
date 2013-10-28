library ch2.ex5;

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
    
    // Draw a big box on the screen
    context..fillStyle = 'black'
        ..fillRect(10, 10, 200, 200)
        ..save(); // Save drawing style to stack to restore later.
    
    // Clip the cavnas to a 50x50 square starting at 0,0
    context..beginPath()
        ..rect(0, 0, 50, 50)
        ..clip();
    
    // Create a red circle
    context..beginPath()
        ..strokeStyle = 'red'
        ..lineWidth = 5
        ..arc(100, 100, 100, (math.PI/180)*0, (math.PI/180)*360) //full circle
        ..stroke()
        ..closePath();
    
    // Reclip to entire canvas
    context..restore() // restore our saved state
        ..beginPath()
        ..rect(0, 0, 500, 500)
        ..clip();
    
    // Draw a blue line that is not clipped.
    context..beginPath()
        ..strokeStyle = 'blue'
        ..lineWidth = 5
        ..arc(100, 100, 50, (math.PI/180)*0, (math.PI/180)*360) //full circle
        ..stroke()
        ..closePath();
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}