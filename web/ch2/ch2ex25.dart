library ch2.ex25;

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
    
    var fillImg = new ImageElement(src: 'fill_20x20.gif');
    fillImg.onLoad.listen((_) {
      // Note Dart has 2 separate createPattern methods.
      // The first, createPattern(canvas, repetitionType) expects to receive
      // a canvas element to use for generating the pattern. To create a
      // pattern with an image file we need the explicit: 
      // createPatternFromImage(image, repetitionType) method.
      var fillPattern = context.createPatternFromImage(fillImg, 'repeat');
      context.fillStyle = fillPattern;
      context.fillRect(0, 0, 200, 200);
    });
    
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}