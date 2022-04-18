void setup() {
  size(392, 267);
  noLoop();
}

void draw() {
  PImage img = loadImage("alce.jpg");
  PImage aux = createImage(img.width, img.height, RGB);

  //Filtro de Escala de Cinza
  for(int y=0; y < img.height; y++) {
    for(int x=0; x < img.width; x++) {
       int pos = y*img.width + x;
       img.pixels[pos] = color(blue(img.pixels[pos]));
    }
  }
     
  //Brilho  
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      float valor = blue(img.pixels[pos])*2.5;
      if (valor > 255) valor = 255;
      else if (valor < 0) valor = 0;
      aux.pixels[pos] = color(valor);
    }
  }
  
  //Limiarização 
  for (int y=0; y < img.height; y++) {
    for (int x=0; x < img.width; x++) {
      int pos = y*img.width + x;
      if (green(aux.pixels[pos]) > 89 && y < 267)
        aux.pixels[pos] = color(0);
      else
      aux.pixels[pos] = color(255);
    }
  }
  image(aux, 0, 0);
  save("alce1.jpg");
}
  
