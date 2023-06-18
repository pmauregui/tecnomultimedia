/*
Alumna: Mauregui, Paula
 Profesor: Albirosa, Tobías
 COM 5
 TP2
 Link al video: https://youtu.be/FCfBdbXZQ5M
 */
 
//DECLARACION

PImage vasarely;
int cant = 40;
int tam;
color naranja;
color negro; 
color negro0;

//ASIGNACION

void setup() {
  size(800, 400);
  vasarely = loadImage ("obra.jpeg");
  naranja = color (171, 57, 36);
  negro = color (0, 0, 0);
  negro0 = color (0, 0, 0, 0);
}

//MODIFICACION Y/O UTILIZACION 

void draw() {
  background(0);
  image (vasarely, 0, 0);

  tam = width/cant;

  for (int x=0; x<cant; x++) {
    for (int y=0; y<cant; y++) {
      dibujar (x, y);
    }
  }
}

//FUNCION QUE NO ME RETORNA UN VALOR
void dibujar (int x, int y) {
  stroke (53, 86, 57);
  fill (48, 97, 52);
  rect (x*tam + 400, y*tam, tam, tam);
  stroke (1);
  noStroke ();
  if (x < 10) {
    fill(lerpColor( negro, naranja, map(x, 0, 10, 0, 1)));
    ellipse (x*tam + 410, y*tam+10, tam-5, tam-5);
  } else if (x >= 10) {
    fill(lerpColor(naranja, negro, map(x, 10, 20, 0, 1)));
    ellipse (x*tam + 410, y*tam+10, tam-5, tam-5);
  }
  if (y < 10) {
    fill(lerpColor( negro, negro0, map(y, 0, 10, 0, 1)));
    ellipse (x*tam + 410, y*tam+10, tam-5, tam-5);
  } else if (y > 10) {
    fill(lerpColor(negro0, negro, map(y, 10, 20, 0, 1)));
    ellipse (x*tam + 410, y*tam+10, tam-5, tam-5);
  }
}


void keyPressed() {
  if (key == 'p') {
    negro = color (random (0, 250), 50, 250);
    naranja = color (random (0, 250), 50, 250);
  }
  if (key == 'a') {
    negro = color (0, 0, 0);
    naranja = color (171, 57, 36);
    cant = 40;
  }
}

void mousePressed() {
  if (mouseActivado() == true) {
    cant ++;
  }
}

//FUNCION QUE ME RETORNA UN VALOR
boolean mouseActivado () {
  if (mouseX >= width/2 && mouseX < width && mouseY >=0 && mouseY < height) {
    return true;
  } else {
    return false;
  }
}
