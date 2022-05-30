UI ui;
ArrayList<Drop> drops;
float translation_display, translation_target;

void setup(){
    size(1000, 500);
    ui = new UI();
    drops = new ArrayList<Drop>();
}

void draw(){
    background(30);
    translateSmooth();
    ui.update();
    ui.render();
    for(Drop d : drops){
        d.render();
    }
}