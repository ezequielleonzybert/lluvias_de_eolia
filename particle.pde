class Particle{
    PVector position;
    float radius;
    boolean drag, selected;
    void update(){
        if(!drag){
            if(hover() && mousePressed){
                drag = true;
                for(Drop d : drops){
                    d.selected = false;
                }
                for(Orb o : orbs){
                    o.selected = false;
                }
                selected = true;
                 //igualamos los valores de los potenciómetros a los de la partícula seleccionada
                for(Button b : ui.containers[1].buttons){
                    for(Orb o : orbs){
                        if(o.selected){
                            switch(b.id){
                            case 1:
                                b.rotation = o.oscilX;
                                break;
                            case 2:
                                b.rotation = o.oscilY;
                                break;
                            case 3:
                                b.rotation = o.speedX;
                                break;
                            case 4:
                                b.rotation = o.speedY;
                                break;
                            }
                        }
                    }
                }
                return;
            }
        }
        else{
            PVector mouse_position = new PVector(mouseX - translation_display, mouseY);
            position.lerp(mouse_position, 0.15);
        }
    }
    void render(){
        float strokeweight = radius * .1;
        if(selected){
            noFill();
            stroke(255);
            strokeWeight(strokeweight);
            circle(position.x, position.y, radius * 2.75);
        }
        fill(255);
        stroke(100);
        strokeWeight(strokeweight);
        circle(position.x, position.y, radius * 2 - strokeweight/2); 
    }
    boolean hover(){
        if(pointInCircle(mouseX - translation_display, mouseY, position.x, position.y, radius)){
            return true;
        }
        return false; 
    }
}