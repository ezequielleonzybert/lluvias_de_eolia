class Drop extends Particle{ //particulas de la escena 1
    PVector acceleration, velocity;
    AudioDrop audio;
    Drop(float x, float y){ //constructor de la partícula
        super.position = new PVector(x, y);        
        super.radius = ui.containers[0].buttons[0].radius;
        acceleration = new PVector(0, .3);
        velocity = new PVector();
        audio = new AudioDrop();
    }
    void update(){
        super.update();
        if(!super.drag){
            velocity.add(acceleration);
            position.add(velocity); 
            if(position.y + radius > height){ //rebotar en el borde inferior
                velocity.y *= -1;
                //reproducir audio
                audio.noteOn();
            }
            position.add(velocity); 
        }
    }
}