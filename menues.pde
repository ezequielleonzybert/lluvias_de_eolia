//acá dibujo todos los menues
class MenuButton{
    String value;
    float x,y,w,s;
    boolean active;

    MenuButton(String value, int x , int y, float s){
        this.x = x;
        this.y = y;
        this.value = value;
        this.s = s;
        textSize(s);
        this.w = textWidth(value);
    }
    boolean hover(){
        return 
            mouseX > this.x && mouseX < this.x+this.w &&
            mouseY < this.y && mouseY > this.y-this.s;
    }

    void highlight(){
        if(hover()){
            stroke(255);
            strokeWeight(3);
            noFill();
            rectMode(CORNER);
            rect(x-15, y-5-s, w+30, s+20 , 10);
        }            
    }

    void draw(){
        textSize(s);
        text(value, x, y);
        highlight();            
    }

    boolean active(){
        if(hover() && mousePressed){
            return true;
        }
        else{
            return false;
        }
    }
}
void mainMenu(){
    MenuButton
        iniciar = new MenuButton("INICIAR", width/2 - 50, height/2 - 50, 30),
        manual = new MenuButton("MANUAL", width/2 - 50, height/2, 30),
        salir = new MenuButton("SALIR", width/2 - 50, height/2 + 50, 30);

   
    if(salir.active()){
        exit();
    }
    if(manual.active()){
        scene = -2;
    }
    if(iniciar.active()){
        scene = -3;
    }

    //Draw
    background(30);
    PImage logo = loadImage("data/imagen.png");
    image(logo, 50, 20);
    iniciar.draw();
    manual.draw();
    salir.draw();
    textSize(15);
    text("Creador de la aplicación: Ezequiel León Zybert", 20, height - 20);
}

void manual(){
    background(30);
    textSize(15);
    text(
        "1. Escena central: puedes agregar tantas pelotitas como quieras desde el menú superior simplemente "+
        "arrastrando el circulo blanco al espacio de la pantalla. Estas pelotitas rebotan en el borde inferior "+
        "generando un sonido. La frecuencia de este sonido es dada por el potenciometro del menú. "+
        "Debes indicar la frecuencia antes de crear la pelotita. Arrastra las pelotitas al círculo negro para "+
        "eliminarlas.\n\n"+
        "2. Escena derecha: aquí las pelotitas se mantienen suspendidas en donde las sueltes, con "+
        "dos potenciómetros de la izquierda controlas la amplitud de movimiento para el eje X e Y respectivamente. "+
        "Con los dos potenciometros de la derecha controlas la velocidad de movimiento en X e Y respectivamente. "+
        "El estado inicial de todos los potenciómetros es 0. Aquí puedes seleccionar las pelotitas con el mouse y "+
        "modificar sus parámetros luego de haberlas creado. La posición horizontal de la pelotita determina su "+
        "tonalidad y la posición vertical su potencia sonora",
        50,50,width-100,height-100
    );
    MenuButton atras = new MenuButton("ATRAS", width/2 - 50, height - 50, 30);
    atras.draw();
    if(atras.active()) scene = -1;
}

void sceneSelect(){
    background(30);
    MenuButton 
        uno = new MenuButton("1", width/2 - 100, height/2, 30),
        dos = new MenuButton("2", width/2, height/2, 30),
        tres = new MenuButton("3", width/2 + 100, height/2, 30);
    
    text("Seleccionar escena", width/2- 100, 100, 20);
    uno.draw(); dos.draw(); tres.draw();

    if(uno.active()){
        scene = 1;
    }
    if(dos.active()){
        scene=1;
        translation_target = constrain(translation_target - width, -width, 0);
    }
    if(tres.active()){
        scene = 1;
        translation_target = constrain(translation_target + width, 0, width);
    }    
}

void home(){
    background(30);
    MenuButton continuar = new MenuButton("CONTINUAR", width/2 - 65, height/2 - 50, 30);
    MenuButton reiniciar = new MenuButton("REINICIAR", width/2 - 65, height/2, 30);
    MenuButton mainmenu = new MenuButton("MENÚ PRINCIPAL", width/2 - 65, height/2 + 50, 30);
    master.gain.setValue(-100);for(Orb o : orbs){
        o.audio.gain.setValue(-100); 
        //no se como destruirla asi que le bajo el volumen
    }
    
    continuar.draw();
    reiniciar.draw();
    mainmenu.draw();

    if(continuar.active()){
        scene = 1;
        for(Orb o : orbs){
            o.audio.gain.setValue(0); 
        }
    }
    if(reiniciar.active()){
        translation_target = 0;
        drops.clear();
        for(Orb o : orbs){
            o.audio.gain.setValue(-100); 
            //no se como destruirla asi que le bajo el volumen
        }
        orbs.clear();
        master.gain.setValue(0);
        scene = 1;
    }
    if(mainmenu.active()){
        translation_target = 0;
        drops.clear();
        for(Orb o : orbs){
            o.audio.gain.setValue(-100); 
            //no se como destruirla asi que le bajo el volumen
        }
        orbs.clear();
        master.gain.setValue(0);
        scene = -1;
    }
}