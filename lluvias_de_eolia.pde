//Ezequiel León Zybert

import java.util.*;
UI ui; //creo un objeto para la interfaz gráfica
ArrayList<Drop> drops; //un array donde se van a guardar las particulas de la escena 1
ArrayList<Orb> orbs;
float translation_display, translation_target; //dos variables para el mecanismo de transición suave entre escenas
//Objeto de audio donde se conectarán la salida de audio de cada partícula.
//este es el mix de todos los audios que analizaremos en la escena 3
Audio master;
int scene = -1;

void setup(){
    size(1000, 500);
    ui = new UI(); //instanciando ui
    drops = new ArrayList<Drop>(); //instanciando el array de drops(partículas)
    orbs = new ArrayList<Orb>();
    master = new Audio();
}

void draw(){
    if(scene == -1){
        mainMenu();
    }
    if(scene == -2){
        manual();
    }
    if(scene == -3){
        sceneSelect();
    }
    if(scene == 1){
        background(30);
        translateSmooth(); //función que hace las transiciones
        master.analysis(); //escena 3
        //rectángulo que tapa la escena 3 en la escena 1
        rectMode(CORNER);
        noStroke();
        fill(30);
        rect(0,0,width*2,height);
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
        
    }
    if(scene == 2){
        home();
    }
}

// ♡ ヽ(*⌒▽⌒*)／ ♡