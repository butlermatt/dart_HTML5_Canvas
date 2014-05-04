library ch3.ex2;

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
  
  /// Message to display.
  String message = 'your text';
  /// Text fill style (Stroke, fill or both)
  String fillOrStroke = 'fill';
  /// Font size to display.
  String textSize = '50';
  /// Font to use for message.
  String fontFace = 'serif';
  /// Color of the font to display
  String textFillColor = '#ff0000';
  /// Where to position the font's baseline.
  String textBaseline = 'middle';
  /// Alignment of the text
  String textAlign = 'center';
  /// Bolder or lighter values.
  String fontWeight = 'normal';
  /// Italic or oblique or normal.
  String fontStyle = 'normal';
  
  
  
  CanvasApp() {
    // Initialize the canvas and context
    theCanvas = document.querySelector('#canvas');
    context = theCanvas.getContext('2d');
    
    // Initialize form elements and add event listeners.
    querySelector('#textBox').onKeyUp.listen(textBoxChanged);
    querySelector('#fillOrStroke').onChange.listen(fillOrStrokeChanged);
    querySelector('#textSize').onChange.listen(textSizeChanged);
    querySelector('#textFillColor').onChange.listen(textFillColorChanged);
    querySelector('#textFont').onChange.listen(textFontChanged);
    querySelector('#textBaseline').onChange.listen(textBaselineChanged);
    querySelector('#textAlign').onChange.listen(textAlignChanged);
    querySelector('#fontWeight').onChange.listen(fontWeightChanged);
    querySelector('#fontStyle').onChange.listen(fontStyleChanged);
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
    context..textBaseline = textBaseline
        ..textAlign = textAlign;
    // Make sure to set your fonts prior to measureText or you will
    // not get back accurate values.
    // Here we use string interpolation instead of string concatentation.
    context.font = '$fontWeight $fontStyle ${textSize}px $fontFace';
    
    var metrics = context.measureText(message);
    var textWidth = metrics.width;
    var xPosition = (theCanvas.width / 2);
    var yPosition = theCanvas.height / 2;
    
    switch(fillOrStroke) {
      case 'fill': 
        context..fillStyle = textFillColor
            ..fillText(message, xPosition, yPosition);
        break;
      case 'stroke':
        context..strokeStyle = textFillColor
            ..strokeText(message, xPosition, yPosition);
        break;
      case 'both':
        context..fillStyle = textFillColor
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
  
  
  void textSizeChanged(Event e) {
    var target = e.target;
    textSize = target.value;
    drawScreen();

  }
  
  void textFillColorChanged(Event e) {
    var target = e.target;
    textFillColor = target.value;
    // Check to make sure it starts with a hash sign.
    if(!textFillColor.startsWith('#')) {
      textFillColor = '#$textFillColor';
    }
    drawScreen();
  }
  
  void textFontChanged(Event e) {
    var target = e.target;
    fontFace = target.value;
    drawScreen();
  }
  
  void textBaselineChanged(Event e) {
    var target = e.target;
    textBaseline = target.value;
    drawScreen();
  }
  
  void textAlignChanged(Event e) {
    var target = e.target;
    textAlign = target.value;
    drawScreen();
  }
  
  void fontWeightChanged(Event e) {
    var target = e.target;
    fontWeight = target.value;
    drawScreen();
  }
  
  void fontStyleChanged(Event e) {
    var target = e.target;
    fontStyle = target.value;
    drawScreen();
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}