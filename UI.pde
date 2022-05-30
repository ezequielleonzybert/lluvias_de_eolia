class UI{
    float thickness = width * .05;
    class Container{
        String id;
        PVector position;
        float w, h;
        Button[] buttons;
        Container(String id, float x, float y, float w, float h, int buttons_amount){
            this.id = id;
            position = new PVector(x, y);
            this.w = w;
            this.h = h;
            buttons = new Button[buttons_amount];
            for(int i = 0; i < buttons_amount; i++){
                float xb, yb;
                xb = position.x - w/2 + (i+.5) * w/buttons_amount ;
                yb = position.y;
                buttons[i] = new Button(xb, yb, thickness * .3);
            }
        }
        void update(){
            if(id == "slide_L"){
                position.x = thickness * .5 - translation_display;
            }
            else if(id == "slide_R"){
                position.x = width - thickness/2 - translation_display;
            }
        }
        void render(){
            noStroke();
            fill(255);
            rectMode(CENTER);
            if(id == "slide_L")
                rect(position.x, height/2, w, h, 0,20,20,0);
            else if(id == "slide_R")
                rect(position.x, height/2, w, h, 20,0,0,20);
            else
                rect(position.x, position.y, w, h, 0,0,20,20);
            for(Button b : buttons){
                b.render();
            }
        }
    }
    Container[] containers = new Container[5];
    UI(){
        containers[0] = new Container("menu_1", width/2, thickness/2, thickness * 3, thickness, 3);
        containers[0].buttons[0].type = "circle";
        containers[0].buttons[1].type = "potentiometer";
        containers[0].buttons[2].type = "trashcan";

        containers[1] = new Container("menu_2", width * .5 + width, thickness/2, thickness * 6, thickness, 6);
        containers[1].buttons[0].type = "circle";
        containers[1].buttons[1].type = "potentiometer";
        containers[1].buttons[2].type = "potentiometer";
        containers[1].buttons[3].type = "potentiometer";
        containers[1].buttons[4].type = "potentiometer";
        containers[1].buttons[5].type = "trashcan";

        containers[2] = new Container("menu_3", width/2 - width, thickness/2, thickness * 2, thickness, 2);
        containers[2].buttons[0].type = "potentiometer";
        containers[2].buttons[1].type = "potentiometer";

        containers[3] = new Container("slide_L", thickness * .5, height/2, thickness, thickness * 2, 0);
        containers[4] = new Container("slide_R", width - thickness/2, height/2, thickness, thickness * 2, 0);
    }
    void update(){
        for(Container c : containers){
            c.update();
        }
    }
    void render(){
        for(Container c : containers){
            c.render();
        }
    }
    String hover_container(){
        for(Container c : containers){ 
            if(
                mouseX - translation_display > c.position.x - c.w/2 && 
                mouseX - translation_display < c.position.x + c.w/2 &&
                mouseY > c.position.y - c.h/2 && 
                mouseY < c.position.y + c.h/2
            ){
                return c.id;
            }
        }
        return "";
    }
    int hover_button(){
        String s = hover_container();
        if(s.contains("menu")){
            int j = s.charAt(5) - '1';
            for(int i = 0; i < containers[j].buttons.length; i++){
                float x = containers[j].buttons[i].position.x;
                float y = containers[j].buttons[i].position.y;
                float r = containers[j].buttons[i].radius;
                if(dist(mouseX - translation_display, mouseY, x, y) < r){
                    return i;
                } 
            }
        } 
        return -1;
    }
}