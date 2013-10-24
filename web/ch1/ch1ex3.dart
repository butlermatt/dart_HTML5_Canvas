library ch1.ex3;

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
    theCanvas = document.querySelector('#canvasOne');
    context = theCanvas.getContext('2d');
  }
  
  void drawScreen() {
    // Content goes here.
    
    print('Drawing Canvas');
    
    // While we could use cascades for all the context calls
    // We'll keep it grouped per area for clarity.
    
    // background
    context..fillStyle = '#ffffaa'
        ..fillRect(0, 0, 500, 300);
    
    // text
    context..fillStyle = '#000000'
        ..font = '20px Sans-Serif'
        ..textBaseline = 'top'
        ..fillText("Hello World", 195, 80);
    
    // image
    // With dart we can pass the src directly in the constructor.
    // Note the actual image provided in the samples differs from
    // that shown in the book.
    var helloWorldImage = new ImageElement(src: 'helloworld.gif');
    helloWorldImage.onLoad.listen((_) { 
      context.drawImage(helloWorldImage, 155, 110);
    });
    
    // box
    context..strokeStyle = '#000000'
        ..strokeRect(5, 5, 490, 290);
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}