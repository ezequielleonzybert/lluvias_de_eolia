class Drop{
    PVector position, acceleration, velocity;
    float radius;
    Drop(float x, float y){
        position = new PVector(x, y);
        acceleration = new PVector(0, .3);
        velocity = new PVector();
        radius = ui.containers[0].buttons[0].radius;
    }
    void update(){
        velocity.add(acceleration);
        position.add(velocity);
        if(position.y + radius > height){
            velocity.y *= -1;
        }
        position.add(velocity);
    }
    void render(){
        fill(255);
        stroke(100);
        float strokeweight = radius * .1;
        strokeWeight(strokeweight);
        circle(position.x, position.y, radius * 2 - strokeweight/2);
    }
}