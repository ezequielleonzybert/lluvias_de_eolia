void translateSmooth(){
    float epsilon = 1;
    if(abs(translation_display - translation_target) > epsilon){
        translation_display = lerp(translation_display, translation_target, .1);
    }
    else translation_display = translation_target;     
    translate(translation_display, 0);
} //123