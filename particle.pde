//la base para las paticulas de la escena 1 y 2. 
//tienen cosas en comun así que las extendí luego
class Particle{ 
    PVector position;
    float radius;
    boolean drag, selected;
    void update(){
        //si no estamos arrastrándola
        if(!drag){ 
            //si el mouse esta sobre la particula y lcikeamos...
            if(hover() && mousePressed){  
                //empezamos a arrastrarla y la seleccionamos
                drag = true;
                for(Drop d : drops){ //primero deseleccionamos la que esté seleccionado.
                    d.selected = false;
                }
                for(Orb o : orbs){
                    o.selected = false;
                }
                //luego seleecionamos esta única partícual
                selected = true;
                 //igualamos los valores de los potenciómetros a los de la partícula seleccionada
                for(Button b : ui.containers[1].buttons){
                    for(Orb o : orbs){
                        if(o.selected){
                            switch(b.id){
                            case 1:
                                b.rotation = o.oscX;
                                break;
                            case 2:
                                b.rotation = o.oscY;
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
        else{ //si se está arrastrando sigue al mouse
            PVector mouse_position = new PVector(mouseX - translation_display, mouseY);
            position.lerp(mouse_position, 0.15);
        }
    }
    void render(){ //dibujando las partículas
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
    boolean hover(){ //métod para detectar si el mouse esta sobre la partícula
        if(pointInCircle(mouseX - translation_display, mouseY, position.x, position.y, radius)){
            return true;
        }
        return false; 
    }
}