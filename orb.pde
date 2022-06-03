class Orb extends Particle{
    PVector position_origin;
    float oscilX, oscilY, speedX, speedY;
    Orb(float x, float y){
        super.position = new PVector(x, y);
        super.radius = ui.containers[0].buttons[0].radius;
        oscilX = oscilY = speedX = speedY = 0;
        position_origin = new PVector();
        for(Button b : ui.containers[1].buttons){
            b.rotation = 0;
        }
    }
    void update(){
        super.update();
        if(!super.drag){ 
            super.position.x = position_origin.x + sin(frameCount * speedX * .02) * oscilX * 75;
            super.position.y = position_origin.y + sin(frameCount * speedY * .02) * oscilY * 37.5;

            if(super.selected){
                for(Button b : ui.containers[1].buttons){
                    switch(b.id){
                        case 1:
                            oscilX = b.rotation;
                            break;
                        case 2:
                            oscilY = b.rotation;
                            break;
                        case 3:
                            speedX = b.rotation;
                            break;
                        case 4:
                            speedY = b.rotation;
                            break;
                    }
                }
            }
        }
    }
}