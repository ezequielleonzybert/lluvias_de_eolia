void mousePressed(){
    String container = ui.hover_container(); //le asigno el nombre del container a la variable container
    int button = ui.hover_button(); // y el nombre del boton a la variable button
    switch(container) {
        case "menu_1":
            switch (button) {
                case 0:  //agrego una particula con su constructor
                    drops.add(new Drop(ui.containers[0].buttons[0].position.x, ui.containers[0].buttons[0].position.y));
                break;            
            }
            break;
        case "slide_L": //aplicando translate por medio de las dos variables translation
            translation_target = constrain(translation_target + width, 0, width);
            break;
        case "slide_R":
            translation_target = constrain(translation_target - width, -width, 0);
            break;
    }
}

void mouseDragged(){
}

void mouseReleased() {
    for(Drop d : drops){
        if(d.drag){
            d.drag = false;
            d.velocity.y = 0;
        }
    }
}