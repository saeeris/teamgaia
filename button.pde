class button {
  // Declare variables
  PVector size;
  PVector pos;
  String type;
  Boolean show;
  String correct;

  
// Customizable Constructor
  button(PVector pos, PVector size, String type){
    rectMode(CENTER);
    this.size = size;
    this.pos = pos;
    this.type = type;
    this.show = false;
  }
  
  
  // Return if button clicked
  boolean buttonClicked(){
    if(abs(mouseX - this.pos.x) <= this.size.x/2 && abs(mouseY - this.pos.y) <= this.size.y/2 && mousePressed){
        return true;
      }
      return false;
    }
    
  
  // Define display
  void display(){
    fill(255);
    textAlign(CENTER, BOTTOM);
    textSize(20);
    rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
    fill(0);
    if (this.show){
      text(this.type, this.pos.x, this.pos.y + 12.5);
    }
  }
  
  //
  Boolean matched(String word){
    if (word == (this.type)){
      return true;
    }
    return false;
  }
} 
