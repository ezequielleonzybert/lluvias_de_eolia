//algunas funciones que uso en otras partes del programa.

void translateSmooth(){
    float epsilon = 1; //límite para terminar la transición, sino es infinita
    if(abs(translation_display - translation_target) > epsilon){
        // con la funcion lerp hago la transición suave
        translation_display = lerp(translation_display, translation_target, .1);
    }
    else translation_display = translation_target;     
    translate(translation_display, 0);
}

boolean pointInRect(float x, float y, float X, float Y, float W, float H ){ //punto dentro de rectangulo?
    if(x > X - W/2 && x < X + W/2 && y > Y - H/2 && y < Y + H/2){
        return true;
    }
    return false;
}

boolean pointInCircle(float x, float y, float X, float Y, float R){ //punto dentro de circulo?
    if(dist(x, y, X, Y) < R){
        return true;
    }
    return false;
}