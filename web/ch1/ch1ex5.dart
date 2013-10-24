library ch1.ex5;

import 'dart:html';
// We would use this if we wanted to use the Timer version of gameLoop.
//import 'dart:async';

// The dart print() command will automatically print to the console
// and shouldn't throw an exception so no need to worry about creating
// our own debugger. For more complicated logging the logger package exists.

// Since dart supports class inheritance and library namespaces
// we don't need to keep our methods/properties in a local scope.
class CanvasApp {
  CanvasElement theCanvas;
  CanvasRenderingContext2D context;
  
  // Our alpha transparency
  num alpha = 0;
  // The text we will display.
  String text = 'Hello World';
  // Background Image
  ImageElement helloWorldImage;
  // If we're fading in or out
  bool fadeIn = true;
  
  // Since we're using animationFrame, we use this to track the difference
  // in timings between gameLoop calls
  num lastFrame = null;
  
  CanvasApp() {
    // Initialize the canvas and context
    theCanvas = document.querySelector('#canvasOne');
    context = theCanvas.getContext('2d');
    helloWorldImage = new ImageElement(src: 'html5bg.jpg');
  }
  
  void drawScreen() {
    // Content goes here.
    
    // Background
    context..globalAlpha = 1
        ..fillStyle = '#000000'
        ..fillRect(0, 0, 640, 480);
    // Background Image
    context..globalAlpha = 0.25
        ..drawImage(helloWorldImage, 0, 0);
    // Text
    context..font = '72px Sans-Serif'
        ..textBaseline = 'top'
        ..globalAlpha = alpha
        ..fillStyle = '#ffffff'
        ..fillText(text, 150, 200);
    
  }

  // gameLoop would have this signature if we used the Timer/Future versions.  
  //void gameLoop() {
  void gameLoop(num totalElapsed) {
    // We calculate our alpha value here since we're using the animationFrame
    // The JS Sample increments alpha by 0.01 every 20ms. This would be
    // 0.0005 per ms.
    if(lastFrame == null) {
      // This is the first frame
      lastFrame = totalElapsed;
    }
    
    // animateFrame passes the total number of seconds since the page
    // originally loaded. We want the number since the last frame was
    // displayed.
    var frameElapsed = totalElapsed - lastFrame;
    lastFrame = totalElapsed;
    // Calculate how much alpha should have changed since the last frame.
    var alphaDelta = (0.01 / 20) * frameElapsed;
    
    if(fadeIn) {
      // fading in so add our alphaDelta to alpha value
      alpha += alphaDelta;
      if(alpha >= 1) {
        // We've reached full alpha so ensure it's just max value (not above)
        // and switch to fading out
        alpha = 1;
        fadeIn = false;
      }
    } else {
      // fading out so subtract our alpha delta
      alpha -= alphaDelta;
      if(alpha <= 0) {
        // Fully transparent, so flip again.
        alpha = 0;
        fadeIn = true;
      }
    }

    drawScreen();
  
    // Because Dart targets 'the modern web' I decided to use animationFrame
    // (the non-cancelable version of requestAnimationFrame) for our loop
    // rather than using a standard timer. I've included the equivalent Timer
    // version in the comments below.
    window.animationFrame.then(gameLoop);
    
    // Non-cancelable version:
    //new Future.delayed(new Duration(milliseconds: 20), gameLoop);
    
    // Cancelable version. As an alternative we could also use
    // new Timer.repeating() from outside of the gameLoop
    
    //new Timer(new Duration(milliseconds: 20), gameLoop);
  }
  
  // Since we don't want to manully call gameLoop with bad values for
  // the time elapsed, we use a method to initially start the animation loop
  void start() {
    window.animationFrame.then(gameLoop);
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.start();
}