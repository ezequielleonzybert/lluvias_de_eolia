class Particle{
    PVector position;
    float radius;
    boolean drag;
    void update(){
        if(!drag){
            if(hover() && mousePressed){
                drag = true;
                return;
            }
        }
        else{
            PVector mouse_position = new PVector(mouseX - translation_display, mouseY);
            position.lerp(mouse_position, 0.15);
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