class Drop{ //particulas de la escena 1
    PVector position, acceleration, velocity;
    float radius;
    boolean drag;
    Drop(float x, float y){ //constructor de la particula
        position = new PVector(x, y);
        acceleration = new PVector(0, .3);
        velocity = new PVector();
        radius = ui.containers[0].buttons[0].radius;
    }
    void update(){
        if(!drag){
            if(hover() && mousePressed){
                drag = true;
                return;
            }
            velocity.add(acceleration);
            //la verdad no entiendo por que tengo que usar dos veces la funcion de add(velocity),
            // pero si la uso una única vez, la posición máxima del rebote varía en cada rebote
            // y yo la necesito constante. Lo descubrí de casualidad. 
            position.add(velocity); 
            if(position.y + radius > height){ //rebotar en el borde inferior
                velocity.y *= -1;
            }
            position.add(velocity);  //acá la repito  ¯\_(ツ)_/¯
        }
        else{
            PVector mouse_position = new PVector(mouseX - translation_display, mouseY);
            position.lerp(mouse_position, 0.1);
        }
    }
    void render(){
        fill(255);
        stroke(100);
        float strokeweight = radius * .1;
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

