library ch2.ex10;

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
    
    // Draw a red square and rotate it
    var angleInRadians = 45 * (math.PI / 180);
    var x = 50;
    var y = 100;
    var height = 40;
    var width = 40;
    
    context..setTransform(1, 0, 0, 1, 0, 0) // Required before rotating
      ..translate(x + (width/2), y + (height/2)) // Change our origin point.
      ..rotate(angleInRadians)  // Rotate before drawing
      ..fillStyle = 'red'
      ..fillRect(-width/2, -height/2, width, height);
    
    // Set new values and draw it again.
    angleInRadians = 75 * (math.PI / 180);
    x = 100;
    y = 100; // not strictly needed
    height = 40; // not strictly needed
    width = 40; // Not strictly needed
    
    context..setTransform(1, 0, 0, 1, 0, 0) // Required before rotating
      ..translate(x + (width/2), y + (height/2)) // Change our origin point.
      ..rotate(angleInRadians)  // Rotate before drawing
      ..fillStyle = 'red'
      ..fillRect(-width/2, -height/2, width, height);
    
    // Set new values and draw it again.
    angleInRadians = 90 * (math.PI / 180);
    x = 150;
    y = 100; // not strictly needed
    height = 40; // not strictly needed
    width = 40; // Not strictly needed
    
    context..setTransform(1, 0, 0, 1, 0, 0) // Required before rotating
      ..translate(x + (width/2), y + (height/2)) // Change our origin point.
      ..rotate(angleInRadians)  // Rotate before drawing
      ..fillStyle = 'red'
      ..fillRect(-width/2, -height/2, width, height);
    
    // Set new values and draw it again.
    angleInRadians = 120 * (math.PI / 180);
    x = 200;
    y = 100; // not strictly needed
    height = 40; // not strictly needed
    width = 40; // Not strictly needed
    
    context..setTransform(1, 0, 0, 1, 0, 0) // Required before rotating
      ..translate(x + (width/2), y + (height/2)) // Change our origin point.
      ..rotate(angleInRadians)  // Rotate before drawing
      ..fillStyle = 'red'
      ..fillRect(-width/2, -height/2, width, height);
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}