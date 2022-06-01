class Orb extends Particle{
    PVector position;
    Orb(float x, float y){
        super.position = new PVector(x, y);
        super.radius = ui.containers[0].buttons[0].radius;
    }
}