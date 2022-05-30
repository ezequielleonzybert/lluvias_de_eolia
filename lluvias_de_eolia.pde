//Ezequiel León Zybert

UI ui; //creo un objeto para la interfaz gráfica
ArrayList<Drop> drops; //un array donde se van a guardar las particulas de la escena 1
float translation_display, translation_target; //dos variables para el mecanismo de transición suave entre escenas

void setup(){
    size(1000, 500);
    ui = new UI(); //instanciando ui
    drops = new ArrayList<Drop>(); //instanciando el array de drops(partículas)
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
}

// ♡ ヽ(*⌒▽⌒*)／ ♡

