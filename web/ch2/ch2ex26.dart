library ch2.ex26;

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
      var fillPattern1 = context.createPatternFromImage(fillImg, 'no-repeat');
      var fillPattern2 = context.createPatternFromImage(fillImg, 'repeat-x');
      var fillPattern3 = context.createPatternFromImage(fillImg, 'repeat-y');
      
      context.fillStyle = fillPattern1;
      context.fillRect(0, 0, 100, 100);
      
      // note this is pattern 3.
      context.fillStyle = fillPattern3;
      context.fillRect(0, 220, 100, 100);
      
      // We need to translate the origin and draw from 0,0 to get repeat-x
      // patern to work. Note this is pattern 2
      // Also note that the screenshots in the book do not show the behaviour
      // of the latest browser builds, though I could not find documentation
      // that a consensus has been reached between browsers on how it should
      // be displayed.
      context.translate(0, 110);
      context.fillStyle = fillPattern2;
      context.fillRect(0, 0, 100, 100);
    });
    
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}