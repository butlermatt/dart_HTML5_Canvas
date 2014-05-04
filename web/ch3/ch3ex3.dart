library ch3.ex3;
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
  /// Font size to display.
  String fontSize = '50';
  /// Font to use for message.
  String fontFace = 'serif';
  /// Color of the font to display
  String textFillColor = '#ff0000';
  /// Alpha value of text (0.0 - 1.0)
  num textAlpha = 1.0;
  /// X-Position of the shadow
  num shadowX = 1;
  /// Y-Position of the shadow
  num shadowY = 1;
  /// Blur radius of the shadow.
  num shadowBlur = 1;
  /// Color of the shadow.
  String shadowColor = '#707070';
  /// Where to position the font's baseline.
  String textBaseline = 'middle';
  /// Alignment of the text
  String textAlign = 'center';
  /// Text fill style (Stroke, fill or both)
  String fillOrStroke = 'fill';
  /// Bolder or lighter values.
  String fontWeight = 'normal';
  /// Italic or oblique or normal.
  String fontStyle = 'normal';
  /// Fill type to use
  String fillType = 'colorFill';
  /// Second text color to use (in case of gradient fill)
  String textFillColor2 = '#000000';
  /// Placeholder for image data for a pattern fill
  ImageElement pattern = new ImageElement();
  
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
    querySelector('#shadowX').onChange.listen(shadowXChanged);
    querySelector('#shadowY').onChange.listen(shadowYChanged);
    querySelector('#shadowBlur').onChange.listen(shadowBlurChanged);
    querySelector('#shadowColor').onChange.listen(shadowColorChanged);
    querySelector('#textAlpha').onChange.listen(textAlphaChanged);
    querySelector('#textFillColor2').onChange.listen(textFillColor2Changed);
    querySelector('#fillType').onChange.listen(fillTypeChanged);
    querySelector('#canvasWidth').onChange.listen(canvasWidthChanged);
    querySelector('#canvasHeight').onChange.listen(canvasHeightChanged);
    querySelector('#canvasStyleWidth').onChange.listen(canvasStyleSizeChanged);
    querySelector('#canvasStyleHeight').onChange.listen(canvasStyleSizeChanged);
    querySelector('#createImageData').onClick.listen(createImageDataPressed);
    
    pattern.src = 'texture.jpg';
  }
  
  void drawScreen() {
    // Content goes here.
    
    // Background
    context..globalAlpha = 1
        ..shadowColor = '#707070'
        ..shadowOffsetX = 0
        ..shadowOffsetY = 0
        ..shadowBlur = 0
        ..fillStyle = '#ffffaa'
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
    context..font = '$fontWeight $fontStyle ${fontSize}px $fontFace'
        ..shadowColor = shadowColor
        ..shadowOffsetX = shadowX
        ..shadowOffsetY = shadowY
        ..shadowBlur = shadowBlur
        ..globalAlpha = textAlpha;
    
    var xPosition = (theCanvas.width / 2);
    var yPosition = theCanvas.height / 2;
    
    var metrics = context.measureText(message);
    var textWidth = metrics.width;
    
    var tmpColor;
    if(fillType == 'colorFill') {
      tmpColor = textFillColor;
    } else if(fillType == 'linearGradient') {
      var gradient = context.createLinearGradient(xPosition - textWidth/2,
          yPosition, textWidth, yPosition);
      gradient..addColorStop(0, textFillColor)
          ..addColorStop(0.6, textFillColor2);
      tmpColor = gradient;
    } else if(fillType == 'radialGradient') {
      var gradient = context.createRadialGradient(xPosition, yPosition,
          int.parse(fontSize), xPosition+textWidth, yPosition, 1);
      gradient..addColorStop(0, textFillColor)
          ..addColorStop(0.6, textFillColor2);
      tmpColor = gradient;
    } else if(fillType == 'pattern') {
      tmpColor = context.createPatternFromImage(pattern, 'repeat');
    } else {
      tmpColor = textFillColor;
    }
    
    switch(fillOrStroke) {
      case 'fill': 
        context..fillStyle = tmpColor
            ..fillText(message, xPosition, yPosition);
        break;
      case 'stroke':
        context..strokeStyle = tmpColor
            ..strokeText(message, xPosition, yPosition);
        break;
      case 'both':
        context..fillStyle = tmpColor
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
    fontSize = target.value;
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
  
  void shadowXChanged(Event e) {
    var target = e.target;
    shadowX = target.valueAsNumber;
    drawScreen();
  }
  
  void shadowYChanged(Event e) {
    var target = e.target;
    shadowY = target.valueAsNumber;
    drawScreen();
  }
  
  void shadowBlurChanged(Event e) {
    var target = e.target;
    shadowBlur = target.valueAsNumber;
    drawScreen();
  }
  
  void shadowColorChanged(Event e) {
    var target = e.target;
    shadowColor = target.value;
    drawScreen();
  }
  
  void textAlphaChanged(Event e) {
    var target = e.target;
    textAlpha = target.valueAsNumber;
    drawScreen();
  }
  
  void textFillColor2Changed(Event e) {
    var target = e.target;
    textFillColor2 = target.value;
    // Check to make sure it starts with a hash sign.
    if(!textFillColor2.startsWith('#')) {
      textFillColor = '#$textFillColor2';
    }
    drawScreen();
  }
  
  void fillTypeChanged(Event e) {
    var target = e.target;
    fillType = target.value;
    drawScreen();
  }
  
  void canvasWidthChanged(Event e) {
    var target = e.target;
    theCanvas.width = target.valueAsNumber.toInt();
    drawScreen();
  }
  
  void canvasHeightChanged(Event e) {
    var target = e.target;
    theCanvas.height = target.valueAsNumber.toInt();
    drawScreen();
  }
  
  void canvasStyleSizeChanged(Event e) {
    var styleWidth = querySelector('#canvasStyleWidth');
    var styleHeight = querySelector('#canvasStyleHeight');
    theCanvas.style..width = '${styleWidth.value}px'
        ..height = '${styleHeight.value}px';
    drawScreen();
  }
  
  void createImageDataPressed(Event e) {
    e.preventDefault();
    var imageDataDisplay = querySelector('#imageDataDisplay') as TextAreaElement;
    imageDataDisplay.value = theCanvas.toDataUrl();
    window.open(imageDataDisplay.value, 'canvasImage', 
        'left=0,top=0,width=${theCanvas.width}, height=${theCanvas.height},'
        'toolbar=0,resizable=0');
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.drawScreen();
}