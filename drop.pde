class Drop{
    PVector position, acceleration, velocity;
    float radius;
    Drop(float x, float y, float r){
        position = new PVector(x, y);
        acceleration = new PVector();
        velocity = new PVector();
        radius = r;
    }
    void render(){
        noStroke();
        fill(255);
        circle(position.x, position.y, radius);
    }
}