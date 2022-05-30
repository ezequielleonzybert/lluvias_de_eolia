void mousePressed(){
    String container = ui.hover_container();
    int button = ui.hover_button();
    switch(container) {
        case "menu_1":
            switch (button) {
                case 0:
                    drops.add(new Drop(ui.containers[0].buttons[0].position.x, ui.containers[0].buttons[0].position.y));
                break;            
            }
            break;
        case "slide_L":
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
    
}