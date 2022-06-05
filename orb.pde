class Orb extends Particle{ //clase para las particulas de la escena 2
    PVector position_origin;
    float oscX, oscY, speedX, speedY; //atributos para el movimiento
    Audio audio; //clase que carga el audio minim
    Orb(float x, float y){
        super.position = new PVector(x, y);
        //le damos el mismo radio que el botón para crearla
        super.radius = ui.containers[0].buttons[0].radius;
        //inicializamos todos sus atributos de movimiento en 0
        oscX = oscY = speedX = speedY = 0;
        position_origin = new PVector();
        //deseleccionamos todas las orbes
        for(Orb o : orbs){
            o.selected = false;
        }
        //seleccionamos la actual
        super.selected = true;
        //igualamos los potenciometros al estado inicial de la particula
        for(Button b : ui.containers[1].buttons){
            b.rotation = 0;
        }
        //instancia de la clase Audio
        audio = new Audio();
    }
    void update(){
        //llamamos al update() de la clase madre Particule
        super.update();
        //mapeamos la posición en la mantalla para asignar frequencia y ganancia al audio
        float freq = map(super.position.x, 0, width, 0, 200);
        float gain = map(super.position.y, height, 0, -30, 12);
        //llamamos al método update de audio con los datos procesados anteriormente
        audio.update(freq, gain);
        //si no se está arrastrando la partículoa...
        if(!super.drag){ 
            //le asignamos la posición con respecto a los atributos de la misma.
            super.position.x = position_origin.x + sin(frameCount * speedX * .04) * oscX * 75;
            super.position.y = position_origin.y + sin(frameCount * speedY * .04) * oscY * 37.5;

            //si la partícula está seleccionada
            if(super.selected){
                //le asignamos valores a sus atributos dependiendo la rotación de cada potenciometro
                for(Button b : ui.containers[1].buttons){
                    switch(b.id){
                        case 1:
                            oscX = b.rotation;
                            break;
                        case 2:
                            oscY = b.rotation;
                            break;
                        case 3:
                            speedX = b.rotation;
                            break;
                        case 4:
                            speedY = b.rotation;
                            break;
                    }
                }
            }
        }
    }
}