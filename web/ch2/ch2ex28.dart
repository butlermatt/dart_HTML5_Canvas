library ch2.ex28;

import 'dart:html';

// The dart print() command will automatically print to the console
// and shouldn't throw an exception so no need to worry about creating
// our own debugger. For more complicated logging the logger package exists.

// Since dart supports class inheritance and library namespaces
// we don't need to keep our methods/properties in a local scope.
class CanvasApp {
  CanvasElement theCanvas;
  CanvasRenderingContext2D context;
  
  // How where to position the object each frame
  num yOffset = 0;
  
  // since we're using AnimationFrame, we can use this to track the 
  // difference in timings between gameLoop calls.
  num lastFrame = null;
  
  CanvasApp() {
    // Initialize the canvas and context
    theCanvas = document.querySelector('#canvas');
    context = theCanvas.getContext('2d');
  }
  
  void drawScreen() {
    // Content goes here.
    
    // Clear the canvas each time the gameloop occurs.
    context.clearRect(0, 0, theCanvas.width, theCanvas.height);
    
    // The samples/book show this assigned to a value however beginPath
    // does not have a return value.
    context..beginPath()
        ..strokeStyle = 'red'
        ..lineWidth = 5
        ..moveTo(0, 0 + yOffset)
        ..lineTo(50, 0 + yOffset)
        ..lineTo(50, 50 + yOffset)
        ..stroke()
        ..closePath();
    
  }
  
  // We're using rAF (or AnimationFrame specifically) so we don't use
  // the Timeout method. Method signature would have no arguments if
  // we wanted to use the timeout method. See chapter 1 example 5
  // for more details.
  void gameLoop(num totalElapsed) {
    // this is the first frame
    if(lastFrame == null) {
      lastFrame = totalElapsed;
    }
    
    drawScreen();
    
    // We calculate our yOffset here and keep the drawing logic only in
    // our drawScreen method. Per the example we call drawScreen() before 
    // we do our calculations not after.
    
    // Calculate how many ms since the last frame.
    var frameElapsed = totalElapsed - lastFrame;
    lastFrame = totalElapsed;
    
    // The sample shows that every 20ms the yOffset increases by 1
    // This would mean it should increase by 0.05 every ms.
    yOffset += (1 / 20) * frameElapsed;
    
    window.animationFrame.then(gameLoop);
  }
  
  // Since we're using rAF and don't want to manually call the gameLoop
  // we need a method to initially start the animationFrame.
  void start() {
    window.animationFrame.then(gameLoop);
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.start();
}