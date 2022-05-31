class Button{
    String type; //tipo de boton, puede ser circulo, potenciometro o tacho de basura
    PVector position;
    float radius;
    float rotation;
    boolean active;
    Button(float x, float y, float r){ //constructor del botón
        position = new PVector(x, y);
        radius = r;
        rotation = .5;
    }
    void render(){
        float strokeweight;
        switch (type) { //el dibujo de cada botón dependiendo su tipo
            case "circle":
                fill(255);
                stroke(100);
                //como processing dibuja las lineas por fuera de la figura hice esto para evitarlo:
                strokeweight = radius * .1;
                strokeWeight(strokeweight);
                circle(position.x, position.y, radius * 2 - strokeweight/2);
            break;
            case "potentiometer":
                push();
                translate(position.x, position.y);
                fill(255);
                stroke(100);
                strokeweight = radius * .4;
                strokeWeight(strokeweight);
                circle(0, 0, radius * 2 - strokeweight/2);
                rotate(rotation * TWO_PI);
                fill(100);
                noStroke();
                float a = radius * .15;
                triangle(-a, a, a, a, 0, 3 * a);
                pop();
            break;
            case "trashcan":
                fill(100);
                noStroke();
                circle(position.x, position.y, radius * 2);
            break;
        }
    }
}