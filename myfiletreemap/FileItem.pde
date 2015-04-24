// Code from Visualizing Data, First Edition, Copyright 2008 Ben Fry.


class FileItem extends SimpleMapItem {
  FolderItem parent;    
  File file;
  String name;
  int level;
  PImage myImage;
  PImage myImage2;
  PImage myImage3;
  PImage myImage4;
  PImage myImage5;

  String path;
  
  color c;
  float hue;
  float brightness;
    
  float textPadding = 8;
  int greatestNum = 250;

    
  float boxLeft, boxTop;
  float boxRight, boxBottom;


  FileItem(FolderItem parent, File file, int level, int order) {
    this.parent = parent;
    this.file = file;
    this.order = order;
    this.level = level;
      
    name = file.getName();
    name = name.toLowerCase();
    size = file.length();
    path = file.getAbsolutePath();
    myImage = loadImage(path);
    myImage2 = loadImage("mWord.png");
    myImage3 = loadImage("mp3.png");
    myImage4 = loadImage("mp4.png");
    myImage5 = loadImage("pdf.png");

    modTimes.add(file.lastModified());
  }

  
  void updateColors() {
    if (parent != null) {
      hue = map(order, 0, parent.getItemCount(), 0, 360);
    }
    brightness = modTimes.percentile(file.lastModified()) * 100;

    colorMode(HSB, 360, 100, 100);
    if (parent == zoomItem) {
      c = color(hue, 80, 80);
    } else if (parent != null) {
      c = color(parent.hue, 80, brightness);
    }
    colorMode(RGB, 255);
  }
  
  
  void calcBox() {
    boxLeft = zoomBounds.spanX(x, 0, width);
    boxRight = zoomBounds.spanX(x+w, 0, width);
    boxTop = zoomBounds.spanY(y, 0, height-50);
    boxBottom = zoomBounds.spanY(y+h, 0, height-50);
  }


  void draw() {
    calcBox();

    fill(c);
    rect(boxLeft, boxTop, boxRight, boxBottom);
    //showPreview();
    if (textFits()) {
      showPreview();
      drawTitle();
      
    } else if (mouseInside()) {
      showPreview();
      rolloverItem = this;
    }
    /*if(mouseClicked()){
      if(name.indexOf(".txt")!= -1 || name.indexOf(".jpg")!= -1 || name.indexOf(".png")!= -1|| name.indexOf(".gif")!= -1){
        if (mouseInside()) {
           open(path);
        }
      }
    }*/
    
   }
    //use open
  /*  void mouseClicked(){
        if(name.indexOf(".txt")!= -1 || name.indexOf(".jpg")!= -1 || name.indexOf(".png")!= -1|| name.indexOf(".gif")!= -1){
        if (mouseInside()) {
           open(path);
        }
      }
      
    }*/
    void showPreview(){
      
      //Preview the photos
      if(name.indexOf(".jpg")!= -1 || name.indexOf(".png")!= -1|| name.indexOf(".gif")!= -1){
        //myImage = loadImage(path);

        float boxWidth = boxRight-boxLeft;
        float boxHeight = boxBottom - boxTop;
        // image(myImage,boxLeft,boxTop,boxRight-boxLeft,boxBottom-boxTop);
        //image(myImage,boxLeft+(boxWidth/4),boxTop+ (boxHeight/6),(boxRight-boxLeft)/2,((boxRight-boxLeft)/2)-((boxRight-boxLeft)/10));
         if(((boxRight-boxLeft)/2)<((boxBottom-boxTop)/2)){
          image(myImage,boxLeft+(boxWidth/4),boxTop+ (boxHeight/4),(boxRight-boxLeft)/2,(boxRight-boxLeft)/2);
        }
        else if(((boxRight-boxLeft)/2)>((boxBottom-boxTop)/2)){
          image(myImage,boxLeft+(boxWidth/4),boxTop+ (boxHeight/4),((boxBottom-boxTop)/2),((boxBottom-boxTop)/2));
        }
        /*if(mouseReleased()){
        // if (mouseInside()) {
            open(path);
    
         //}
        }*/

      }
       //Preview the .docx
      if(name.indexOf(".docx")!= -1 ){
       // myImage2 = loadImage("mWord.png");
        float boxWidth = boxRight-boxLeft;
        float boxHeight = boxBottom - boxTop;
        //image(myImage2,boxLeft,boxTop,boxRight-boxLeft,boxBottom-boxTop);
        //image(myImage2,boxLeft+(boxWidth/4),boxTop+ (boxHeight/6),(boxRight-boxLeft)/2,(boxRight-boxLeft)/2);
         if(((boxRight-boxLeft)/2)<((boxBottom-boxTop)/2)){
          image(myImage2,boxLeft+(boxWidth/4),boxTop+ (boxHeight/4),(boxRight-boxLeft)/2,(boxRight-boxLeft)/3);
        }
        else if(((boxRight-boxLeft)/2)>((boxBottom-boxTop)/2)){
          image(myImage2,boxLeft+(boxWidth/4),boxTop+ (boxHeight/4),((boxBottom-boxTop)/2),((boxBottom-boxTop)/3));
        }

      }
      //open(path);
      if(name.indexOf(".mp3")!= -1 ){
        //myImage3 = loadImage("mp3.png");
        float boxWidth = boxRight-boxLeft;
        float boxHeight = boxBottom - boxTop;
        //image(myImage3,boxLeft,boxTop,boxRight-boxLeft,boxBottom-boxTop);
        if(((boxRight-boxLeft)/2)<((boxBottom-boxTop)/2)){
          image(myImage3,boxLeft+(boxWidth/4),boxTop+ (boxHeight/4),(boxRight-boxLeft)/2,(boxRight-boxLeft)/2);
        }
        else if(((boxRight-boxLeft)/2)>((boxBottom-boxTop)/2)){
          image(myImage3,boxLeft+(boxWidth/4),boxTop+ (boxHeight/4),((boxBottom-boxTop)/2),((boxBottom-boxTop)/2));
        }

      }
      if(name.indexOf(".mp4")!= -1 ){
        //myImage4 = loadImage("mp4.png");
        float boxWidth = boxRight-boxLeft;
        float boxHeight = boxBottom - boxTop;
        //image(myImage4,boxLeft,boxTop,boxRight-boxLeft,boxBottom-boxTop);
        //image(myImage4,boxLeft+(boxWidth/4),boxTop+ (boxHeight/6),(boxRight-boxLeft)/2,(boxRight-boxLeft)/2);
         if(((boxRight-boxLeft)/2)<((boxBottom-boxTop)/2)){
          image(myImage4,boxLeft+(boxWidth/4),boxTop+ (boxHeight/4),(boxRight-boxLeft)/2,(boxRight-boxLeft)/2);
        }
        else if(((boxRight-boxLeft)/2)>((boxBottom-boxTop)/2)){
          image(myImage4,boxLeft+(boxWidth/4),boxTop+ (boxHeight/4),((boxBottom-boxTop)/2),((boxBottom-boxTop)/2));
        }

      }
       if(name.indexOf(".pdf")!= -1 ){
        //myImage5 = loadImage("pdf.png");
        float boxWidth = boxRight-boxLeft;
        float boxHeight = boxBottom - boxTop;
        //image(myImage5,boxLeft,boxTop,boxRight-boxLeft,boxBottom-boxTop);
        //image(myImage5,boxLeft+(boxWidth/4),boxTop+ (boxHeight/6),(boxRight-boxLeft)/2,(boxRight-boxLeft)/2);
         if(((boxRight-boxLeft)/2)<((boxBottom-boxTop)/2)){
          image(myImage5,boxLeft+(boxWidth/4),boxTop+ (boxHeight/4),(boxRight-boxLeft)/2,(boxRight-boxLeft)/2);
        }
        else if(((boxRight-boxLeft)/2)>((boxBottom-boxTop)/2)){
          image(myImage5,boxLeft+(boxWidth/4),boxTop+ (boxHeight/4),((boxBottom-boxTop)/2),((boxBottom-boxTop)/2));
        }

      }
      //Read the txt files
      if(name.indexOf(".txt")!= -1){
        String[] lines = loadStrings(path);
        char testChar = 'd'; 
        int numLines = (int) this.h / 13;
        int numChars = (int) (this.w/textWidth(testChar));
        for(int i=0;i<Math.min(numLines,lines.length);i++) {  
          String s = lines[i].substring(0,Math.min(numChars,lines[i].length()));
          fill(255);
          text(s,x,this.y + 13*i +13);  

        }
       /* if(mouseReleased()){
        // if (mouseInside()) {
            open(path);
    
          //}
        }*/
      }
 
        /* 
        int numLines = lines.length;
        if (numLines > greatestNum){
          greatestNum = numLines;
        }
      
        map(numLines, 0, greatestNum, 1, 5);
        for (int i = 0; i < numLines; i++) {
          String [] line = lines[i].split(" ");
          for(int j=0;j<line.length;j++) {
            float textY = boxTop;
            float textX = boxLeft;
            char [] chars = line[j].toCharArray();
            for(int t=0; t<line[j].length(); t++){
              while(textY<boxBottom){
                while(textX<boxRight){
                  text(chars[t],textX,textY);
                  textX+=3;
                }
                textY+=4;
              }
            }
        }
      }*/
      
    
    }
  void drawTitle() {
    fill(255, 200);
    
    float middleX = (boxLeft + boxRight) / 2;
    float middleY = (boxTop + boxBottom) / 2;
    if (middleX > 0 && middleX < width && middleY > 0 && middleY < height-50) {
      if (boxLeft + textWidth(name) + textPadding*2 > width) {
        textAlign(RIGHT);
        text(name, width - textPadding, boxBottom - textPadding);
      } else {
        textAlign(LEFT);
        text(name, boxLeft + textPadding, boxBottom - textPadding);
      }
    }
  }


  boolean textFits() {
    float wide = textWidth(name) + textPadding*2;
    float high = textAscent() + textDescent() + textPadding*2;
    return (boxRight - boxLeft > wide) && (boxBottom - boxTop > high); 
  }
    
 
  boolean mouseInside() {
    return (mouseX > boxLeft && mouseX < boxRight && 
            mouseY > boxTop && mouseY < boxBottom);    
  }
/*void  mouseClicked(){
  if(name.indexOf(".txt")!= -1 || name.indexOf(".jpg")!= -1 || name.indexOf(".png")!= -1|| name.indexOf(".gif")!= -1){
    if (mouseInside()) {
       open(path);
    }
  }
}*/
/*void mouseReleased(){
  //if(key =='o'){
        if(name.indexOf(".txt")!= -1 || name.indexOf(".jpg")!= -1 || name.indexOf(".png")!= -1|| name.indexOf(".gif")!= -1){
          if (mouseX > boxLeft && mouseX < boxRight && 
            mouseY > boxTop && mouseY < boxBottom) {
             open(path);
          }
       }
  //}
  
}*/
  boolean mousePressed() {
    if (mouseInside()) {
      if (mouseButton == LEFT) {
        if(parent == zoomItem){
           if(name.indexOf(".mp4")!= -1 || name.indexOf(".mp3")!= -1 ||name.indexOf(".txt")!= -1 || name.indexOf(".jpg")!= -1 || name.indexOf(".png")!= -1|| name.indexOf(".gif")!= -1){

              open(path);
           }
        }
        else{
        parent.zoomIn();
        return true;
        }

      } else if (mouseButton == RIGHT) {
        if (parent == zoomItem) {
          parent.zoomOut();
        } else {
          parent.hideContents();
        }
        return true;
      }
    }
    return false;
  }
}
