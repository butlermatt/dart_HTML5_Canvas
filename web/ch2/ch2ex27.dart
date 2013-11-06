library ch2.ex27;

import 'dart:html';
import 'dart:math' show PI; // Only show PI from math library.

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
    
    // The download javascript sample shows the content in the
    // online for a gif which isn't used. The book shows correct
    // content.
    context.fillStyle = 'red';
    
    // Create a red square with a black shadow on the bottom right sides
    // The book has an error showing this as -4 for offsetX and Y
    // Download sample shows correct values.
    context..shadowOffsetX = 4
        ..shadowOffsetY = 4
        ..shadowColor = 'black'
        ..shadowBlur = 4
        ..fillRect(10, 10, 100, 100);
    
    // Create a red square with a black shadow on the top left
    context..shadowOffsetX = -4
        ..shadowOffsetY = -4
        ..shadowColor = 'black'
        ..shadowBlur = 4
        ..fillRect(150, 10, 100, 100);
    
    // Create a red circle with a light gray shadow to the lower right
    context..shadowOffsetX = 10
        ..shadowOffsetY = 10
        ..shadowColor = 'rgb(100,100,100)'
        ..shadowBlur = 8
        ..arc(200, 300, 100, (PI/180) * 0, (PI/180) * 360)
        ..fill();
    
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}