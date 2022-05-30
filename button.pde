class Button{
    String type;
    PVector position;
    float radius;
    Button(float x, float y, float r){
        position = new PVector(x, y);
        radius = r;
    }
    void render(){
        if(type != null){
            float strokeweight;
            switch (type) {
                case "circle":
                    fill(255);
                    stroke(100);
                    strokeweight = radius * .1;
                    strokeWeight(strokeweight);
                    circle(position.x, position.y, radius * 2 - strokeweight/2);
                break;
                case "potentiometer":
                    fill(255);
                    stroke(100);
                    strokeweight = radius * .4;
                    strokeWeight(strokeweight);
                    circle(position.x, position.y, radius * 2 - strokeweight/2);
                break;
                case "trashcan":
                    fill(100);
                    noStroke();
                    circle(position.x, position.y, radius * 2);
                break;
            }
        }
    }
}