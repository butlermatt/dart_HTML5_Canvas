library ch1.ex4;

// Required for accessing the DOM (getting our canvas)
import 'dart:html';
// Required to get Random class
import 'dart:math' show Random;

// The dart print() command will automatically print to the console
// and shouldn't throw an exception so no need to worry about creating
// our own debugger. For more complicated logging the logger package exists.

// Since dart supports class inheritance and library namespaces
// we don't need to keep our methods/properties in a local scope.
class CanvasApp {
  CanvasElement theCanvas;
  CanvasRenderingContext2D context;
  // Number of guesses that have been made.
  num guesses = 0;
  // String to display if guess should be higher or lower
  String higherOrLower = '';
  // Flag to see if the game is done.
  bool gameOver;
  // The letter we want to guess
  String letterToGuess;
  
  // Our message to display.
  final message = "Guess The Letter From a (lower) to z (higher)";
  // Possible choices to make.
  final letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
                   'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
                   'y', 'z'];
  // Letters we've already guessed.
  final lettersGuessed = [];
  // Today's date.
  final today;
  
  CanvasApp() : today = new DateTime.now() {
    // Initialize the canvas and context
    theCanvas = document.querySelector('#canvasOne');
    context = theCanvas.getContext('2d');
  }
  
  void initGame() {
    // Create an instance of Random
    var rand = new Random();
    // Random provides a handy way of getting an integer in the range
    // we need.
    var letterIndex = rand.nextInt(letters.length);
    letterToGuess = letters[letterIndex];
    // Initialize gameOver to be false.
    gameOver = false;
    
    // Setup our various event handlers.
    
    // This would preferably be a KeyboardEventStream however
    // it appears to be blocked by http://dartbug.com/14044
    // KeyboardEventStream.onKeyDown(document.body).listen(eventKeyPressed);
    document.body.onKeyDown.listen(eventKeyPressed);
    var buttonElement = document.querySelector('#createImageData');
    buttonElement.onClick.listen(createImageDataPressed);
    
    drawScreen();
  }
  
  // Our KeyDown handler
  void eventKeyPressed(KeyboardEvent e) {
    // Don't do anything if the game is already over.
    if(gameOver) return;
    
    print('keycode: ${e.keyCode}');
    var letterPressed = new String.fromCharCode(e.keyCode).toLowerCase();
    guesses++;
    lettersGuessed.add(letterPressed);
    
    if(letterPressed == letterToGuess) {
      gameOver = true;
    } else {
      var letterIndex = letters.indexOf(letterToGuess);
      var guessIndex = letters.indexOf(letterPressed);
      print('Guess Index: $guessIndex');
      if(guessIndex < 0) {
        higherOrLower = 'That is not a letter';
      } else if(guessIndex > letterIndex) {
        higherOrLower = 'Lower';
      } else {
        higherOrLower = 'Higher';
      }
    }
    
    drawScreen();
  }
  
  void drawScreen() {
    // Content goes here.
    
    // Background
    context..fillStyle = '#ffffaa'
        ..fillRect(0, 0, 500, 300);
    
    // Box
    context..strokeStyle = '#000000'
        ..strokeRect(5, 5, 490, 290);
    
    // Date
    context..textBaseline = 'top'
        ..fillStyle = '#000000'
        ..font = '10px Sans-Serif'
        ..fillText(today.toString(), 150, 10);
    
    // Message
    context..fillStyle = '#ff0000'
        ..font = '14px Sans-Serif'
        ..fillText(message, 125, 30);

    // Guesses
    context..fillStyle = '#109910'
        ..font = '16px Sans-Serif'
        ..fillText('Guesses: $guesses', 215, 50);
    
    // Higher or Lower
    context..fillStyle = '#000000'
        ..font = '16px Sans-Serif'
        ..fillText('Higher or Lower: $higherOrLower', 150, 125);
    
    // Letters Guessed
    context..fillStyle = '#ff0000'
        ..font = '16px Sans-Serif'
        ..fillText('Letters Guessed: $lettersGuessed', 10, 260);
    
    if(gameOver) {
      context..fillStyle = '#ff0000'
          ..font = '40px Sans-Serif'
          ..fillText('You Got it!', 150, 180);
    }
    
  }
  
  // Our onClick handler.
  void createImageDataPressed(Event e) {
    window.open(theCanvas.toDataUrl(),
        "canavsImage",
        "left=0,top=0,width=${theCanvas.width},height=${theCanvas.height},toolbar=0,resizable=0");
  }
}

void main() {
  var canvasApp = new CanvasApp();
  canvasApp.initGame();
}