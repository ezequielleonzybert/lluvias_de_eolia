//Ezequiel León Zybert

import java.util.*;
UI ui; //creo un objeto para la interfaz gráfica
ArrayList<Drop> drops; //un array donde se van a guardar las particulas de la escena 1
ArrayList<Orb> orbs;
float translation_display, translation_target; //dos variables para el mecanismo de transición suave entre escenas
//Objeto de audio donde se conectarán la salida de audio de cada partícula.
//este es el mix de todos los audios que analizaremos para la escena 3
Audio master;

void setup(){
    size(1000, 500);
    ui = new UI(); //instanciando ui
    drops = new ArrayList<Drop>(); //instanciando el array de drops(partículas)
    orbs = new ArrayList<Orb>();
    master = new Audio();
}

void draw(){
    background(30);
    translateSmooth(); //función que hace las transiciones
    ui.update();
    ui.render();
    for(Drop d : drops){ // un bucle for para recorrer cada partícula
        d.update();
        d.render();
    }
    for(Orb o : orbs){ // un bucle for para recorrer cada partícula
        o.update();
        o.render();
    }
    master.analysis();
}

// ♡ ヽ(*⌒▽⌒*)／ ♡