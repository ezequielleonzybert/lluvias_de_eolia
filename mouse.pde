void mousePressed(){
    String container_id = ui.hover().container_id;
    int container_index = ui.hover().container_index;
    String button_type = ui.hover().button_type;
    int button_index = ui.hover().button_index;

    if(button_index != -1){
        ui.containers[container_index].buttons[button_index].active = true;
    }
    switch(container_id) {
        case "menu_1":
            if(button_index == 0){
                drops.add(new Drop(
                    ui.containers[container_index].buttons[button_index].position.x,
                    ui.containers[container_index].buttons[button_index].position.y)
                );      
            }
            break;
        case "menu_2":
            if(button_index == 0){
                orbs.add(new Orb(
                    ui.containers[container_index].buttons[button_index].position.x,
                    ui.containers[container_index].buttons[button_index].position.y)
                );
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
    for(UI.Container c : ui.containers){
        for (Button b : c.buttons){
            if(b.active){
                b.rotation = constrain(map(mouseX, 0, width, 0, TWO_PI * .9), 0, TWO_PI * .9);
            }
        }
    }
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
    for(int i = orbs.size() - 1; i >= 0; i--){
        if(orbs.get(i).drag){
            orbs.get(i).drag = false;
            orbs.get(i).position_origin.x = orbs.get(i).position.x;
            orbs.get(i).position_origin.y = orbs.get(i).position.y;
            if(ui.hover().button_type == "trashcan"){
                orbs.remove(i); 
            }
        }
    }
    for(UI.Container c : ui.containers){
        for(Button b : c.buttons){
            b.active = false;
        }
    }
}