void mousePressed(){
    String container = ui.hover().container_id;
    int button = ui.hover().button_index;
    switch(container) {
        case "menu_1":
            switch (button) {
                case 0:  //agrego una particula con su constructor
                    drops.add(new Drop(
                        ui.containers[0].buttons[0].position.x,
                        ui.containers[0].buttons[0].position.y)
                    );
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
    for(int i = drops.size() - 1; i >= 0; i--){
        if(drops.get(i).drag){
            drops.get(i).drag = false;
            drops.get(i).velocity.y = 0;
            if(ui.hover().button_type == "trashcan"){
                drops.remove(i); 
            }
        }
    }
    
}