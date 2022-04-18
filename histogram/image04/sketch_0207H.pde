void setup() {
  size(780, 600);
  background(255);
  noLoop();
}

void draw() {
// Carrega a imagem "0207.jpg". 
PImage img = loadImage("0207.jpg");

// Cria três vetores com 256 posições para cada canal de cor.
int[] histR = new int[256];
int[] histG = new int[256];
int[] histB = new int[256];

// Inicializa com o valor 0 todas as posições dos três vetores.
for(int i = 0 ; i < 256; i++) {
   histR[i] = histG[i] = histB[i] = 0; 
}

// Calcula o histograma. 
for (int y = 0; y < img.height; y++) {
  for (int x = 0; x < img.width; x++) {
    int valueRed = int(red(img.pixels[y*img.width+x]));
    histR[valueRed]++;
    int valueGreen = int(green(img.pixels[y*img.width+x]));
    histG[valueGreen]++; 
    int valueBlue = int(blue(img.pixels[y*img.width+x]));
    histB[valueBlue]++; 
  }
}

// Encontra o maior valor do histograma
int histMaxR = max(histR);
int histMaxG = max(histG);
int histMaxB = max(histB);
int[] histMaxRGB = {histMaxR, histMaxG, histMaxB};
int histMax = max(histMaxRGB);

// Desenha o histograma na janela gráfica.
for (int i = 0; i < 256; i +=1) {
  // Converte o valor do histograma em um ponto entre
  // a parte inferior e superior da janela
  int y = int(map(histR[i], 0, histMax, 0, 600));
  stroke(255,0,0);
  line(i+2, 600, i+2, 600-y);
  
  y = int(map(histG[i], 0, histMax, 0, 600));
  stroke(0,255,0);
  line(i+260, 600, i+260, 600-y);
  
  y = int(map(histB[i], 0, histMax, 0, 600));
  stroke(0,0,255);
  line(i+520, 600, i+520, 600-y);
}
strokeWeight(1);
stroke(0);
line(259,0,259,600);
line(519,0,519,600);
save("0207H.png");
}
