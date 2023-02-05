import java.util.*;

// Define variables
button uterus;
button fallopian_tube;
button fimbriae;
button ovary;
button cervix;
button vagina;
PImage img;
PImage wolf;
int points;
ArrayList<button> buttons;
int idx;
int high;
String wolftext;

void setup(){
  size(700, 500);
  
  // Set up buttons
  uterus = new button(new PVector(height/2, 30),  new PVector(80, 30), "uterus");
  uterus.correct = "That's right! The \n uterus is where \n offspring are conceived \n and developed!";
  fallopian_tube = new button(new PVector(400, 50),  new PVector(160, 30), "fallopian tube");
  fallopian_tube.correct = "That's right! The \n fallopian tubes are \n where ovum pass from \n an ovary to the uterus!";
  fimbriae = new button(new PVector(70, 270),  new PVector(100, 30), "fimbriae");
  fimbriae.correct = "That's right! The \n fimbriae sweep ovum \n into the fallopian tube!";
  ovary = new button(new PVector(120, 330),  new PVector(70, 30), "ovary");
  ovary.correct = "That's right! The \n ovaries are responsible \n for secreting the \n hormones estrogen and \n pregesterone!";
  cervix = new button(new PVector(360, 300),  new PVector(80, 30), "cervix");
  cervix.correct = "That's right! The \n cervix connects the \n vagina to the uterus!";
  vagina = new button(new PVector(360, 405),  new PVector(80, 30), "vagina");
  vagina.correct = "That's right! The \n vagina is responsible \n for sexual intercourse \n and childbirth!";
  
  // Add buttons to array list and shuffle
  buttons = new ArrayList<button>();
  buttons.add(uterus);
  buttons.add(fallopian_tube);
  buttons.add(fimbriae);
  buttons.add(ovary);
  buttons.add(cervix);
  buttons.add(vagina);
  Collections.shuffle(buttons);
  
  // Load images and misc variables
  img = loadImage("img.png");
  wolf = loadImage("wolf.png");
  points = 0;
  idx = 0;
  high = 0;
  wolftext = "Hi! Click on the \n box that matches \n the question!";
}

void draw(){
  // Load image
  background(220, 221, 245);
  image(img, 0, 0, 500, 500);
  image(wolf, 400, 225, 300, 300);
  
  // Update answer and display question and scores
  fill(43, 53, 234);
  String ans = buttons.get(idx).type;
  text("Where is the\n" + ans + "?", 100, 75);
  text("Points: " + points, 100, 400);
  text("High Score: " + high, 100, 450);
  text(wolftext, 560, 235);
  
  // Display each button
  for (int i = 0; i < buttons.size(); i++) {
    button b = buttons.get(i);
    b.display();
    
    // Respond based on if correct answer clicked
    if (b.buttonClicked()){
      delay(200);
      if(b.matched(ans)){
        b.show = true;
        points += 1;
        idx += 1;
        wolftext = b.correct;
      } else {
        points -= 1;
        wolftext = "That's not it! \n Try again!";
      }
    } 
  }
  
  // Conditions to restart
  if (idx >= buttons.size()){
    idx = 0;
    buttons.get(buttons.size()-1).display();
    if (points > high){
      high = points;
      }
    points = 0;
    for (int i = 0; i < buttons.size(); i++) {
      button b = buttons.get(i);
      b.show = false;
      }
    wolftext = buttons.get(buttons.size()-1).correct + "\nLet's play again!";
    Collections.shuffle(buttons);
  } 
}
