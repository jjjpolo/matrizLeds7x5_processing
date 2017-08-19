int [] rojo = {220, 20, 60};  //valores RGB para el rojo claro (led on)
int [] darkRojo = {236, 222, 218}; //valores RGB para el rojo oscuro (led off)

//definiciones globales del ancho y alto para los circulos; considerarlos ancho=alto para una simetria adecuada
int ancho = 50; //dimensiones horizontales de cada circulo
int alto = 50;  //dimensiones verticales de cada circulo

int ledsX = 5;  //indica la cantidad de leds a lo largo (eje X)
int ledsY = 7;  //indica la cantidad de leds a lo alto (eje Y)

boolean[][] matrizLeds = new boolean[10][10];  //mantiene un registro de la matriz de leds; true es encendido y false apagado

//=============================================================CONFIGURACION
void setup()
{
  background(0, 0, 0);  //fondo negro
  size(250, 350);  //debido a que el size no puede configurarse con variables considerar ancho*5 y alto*7
  dibujarLEDSoff(); //manda llamar la funcion que dibuja a todos los leds apagados
}

//=============================================================funciones de usuario
void dibujarLEDSoff()
{
  for (int i = 0; i < ledsY; i++)
  {
    for (int j = 0; j < ledsX; j++)
    {
      dibujarCirculo(j, i, false);  //dibuja circulo en coordenada (fila,columna) j,i apagado
    }
  }
}

//--------------------
void dibujarCirculo(int fila, int columna, boolean estado) //recibe las coordenadas del circulo en fila, columna y las calcula a pixeles
{ //***solo usada para dibujar al inicio
  int x = fila*ancho +(ancho/2);  //calcula la posicion x del circulo a partir de la fila y del ancho establecido de forma global
  int y = columna * alto + (alto/2); //calcula la posicion x a partir de la columna y del alto establecido
  if (estado)                //si el estado es true lo pinta rojo claro
    fill(rojo[0], rojo[1], rojo[2]);
  else                       //si es false lo pinta rojo oscuro
  fill(darkRojo[0], darkRojo[1], darkRojo[2]);
  ellipse(x, y, ancho, alto);
}

//--------------------
void actualizarMatriz(int[] coordenada)      //recibe un array con las coordenadas qequivalentes al led que se va a trabjar
{
  //hace un toogle de estado en cada led
  if (matrizLeds[coordenada[0]][coordenada[1]] == true)
    matrizLeds[coordenada[0]][coordenada[1]] = false;
  else
    matrizLeds[coordenada[0]][coordenada[1]] = true;
}


//--------------------
boolean getEstadoLed(int[] coordenada)  //recibe un array con las coordenadas qequivalentes al led que se va a trabjar
{
  return matrizLeds[coordenada[0]][coordenada[1]];       //decuelve el estado del led
}

//--------------------
void dibujarCirculo(int[] coordenada)  //recibe las coordenadas del circulo (fila, columna) en un arreglo
{
  int[] ram = {coordenada[0], coordenada[1]};  //alamcenamos temporalmente en un array las coordenadas del circulo que se esta trabajando
  int x = coordenada[0]*ancho +(ancho/2);
  int y = coordenada[1] * alto + (alto/2);

  actualizarMatriz(ram);  //manda llamar la funcion que hace toogle al estado del led que se esta trabajando

  boolean estado = getEstadoLed(ram);

  //de acuerdo al estado se establece el color del fill

  if (estado)
    fill(rojo[0], rojo[1], rojo[2]);
  else
    fill(darkRojo[0], darkRojo[1], darkRojo[2]);

  ellipse(x, y, ancho, alto);
}

//--------------------
int[] mouseToCircle()      //conviete las coordenadas del mouse en numero de fila y columna equivalentes al circulo clickeado
{
  int[] coordenadaCirculo = new int[2]; //X->0 Y->1 

  coordenadaCirculo[0] = mouseX / ancho;  //determinal la columna (en x)
  coordenadaCirculo[1] = mouseY / alto;   //determina la fila (en y)

  return (coordenadaCirculo); //regresa las coordenadas equivalentes en un arreglo
}


//=====================================Interrupciones

void mousePressed() 
{
  dibujarCirculo(mouseToCircle());  //dibuja el circulo equivalente al cambio de estado en las coordenadas del mouse (x,y)
}

//=============================================================funcion main
void draw()
{
  if (mousePressed && (mouseButton == LEFT)) {

  } else if (mousePressed && (mouseButton == RIGHT)) {

  } else {

  }

}