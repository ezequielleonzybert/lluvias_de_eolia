void mousePressed(){
    switch(ui.hover_container()) {
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