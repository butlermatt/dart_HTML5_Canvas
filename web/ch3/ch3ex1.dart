library ch3.ex1;

import 'dart:html';

// The dart print() command will automatically print to the console
// and shouldn't throw an exception so no need to worry about creating
// our own debugger. For more complicated logging the logger package exists.

// Since dart supports class inheritance and library namespaces
// we don't need to keep our methods/properties in a local scope.
class CanvasApp {
  CanvasElement theCanvas;
  CanvasRenderingContext2D context;
  
  // DartDoc style comments provide tooltips in the editor so used for
  // public class variables below.
  /// Text box which will contain the message to display.
  InputElement textBox;
  /// Select box which indicates to fill/stroke or both the text.
  SelectElement selectFillOrStroke;
  /// Message to display.
  String message = 'your text';
  /// Text fill style (Stroke, fill or both)
  String fillOrStroke = 'fill';
  
  
  CanvasApp() {
    // Initialize the canvas and context
    theCanvas = document.querySelector('#canvas');
    context = theCanvas.getContext('2d');
    
    // Initialize form elements and add event listeners.
    textBox = document.querySelector('#textBox');
    textBox.onKeyUp.listen(textBoxChanged);
    selectFillOrStroke = document.querySelector('#fillOrStroke');
    selectFillOrStroke.onChange.listen(fillOrStrokeChanged);
  }
  
  void drawScreen() {
    // Content goes here.
    
    // Background
    context..fillStyle = '#ffffaa'
        ..fillRect(0, 0, theCanvas.width, theCanvas.height)
    // Box
        ..strokeStyle = '#000000'
        ..strokeRect(5, 5, theCanvas.width - 10, theCanvas.height - 10);
    
    // Text
    // Make sure to set your fonts prior to measureText or you will
    // not get back accurate values.
    context.font = '50px serif';
    
    var metrics = context.measureText(message);
    var textWidth = metrics.width;
    var xPosition = (theCanvas.width / 2) - (textWidth / 2);
    var yPosition = theCanvas.height / 2;
    
    switch(fillOrStroke) {
      case 'fill': 
        context..fillStyle = '#ff0000'
            ..fillText(message, xPosition, yPosition);
        break;
      case 'stroke':
        context..strokeStyle = '#ff0000'
            ..strokeText(message, xPosition, yPosition);
        break;
      case 'both':
        context..fillStyle = '#ff0000'
            ..fillText(message, xPosition, yPosition)
            ..strokeStyle = '#000000'
            ..strokeText(message, xPosition, yPosition);
        break;
    }
    
  }
  
  void textBoxChanged(KeyboardEvent e) {
    var target = e.target;
    message = target.value;
    drawScreen();
  }
  
  void fillOrStrokeChanged(Event e) {
    var target = e.target;
    fillOrStroke = target.value;
    drawScreen();
  }
  
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}