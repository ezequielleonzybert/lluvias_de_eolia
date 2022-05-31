class UI{
    float thickness = width * .05; // grosor de los menu
    class Container{ //hay 3 menues y 2 botones para pasar de escena, son los containers
        String id; 
        PVector position;
        float w, h;
        Button[] buttons; // un array de tipo Button sin determinar tamaño aun para los botones de cada container, 
        Container(String id, float x, float y, float w, float h, int buttons_amount){ //constructor
            this.id = id;
            position = new PVector(x, y);
            this.w = w;
            this.h = h;
            buttons = new Button[buttons_amount]; //determinamos la cantidad de botones con el argumento
            for(int i = 0; i < buttons_amount; i++){ // bucle la cantidad de veces botones haya
                float xb, yb;
                xb = position.x - w/2 + (i+.5) * w/buttons_amount ; //posición de cada boton
                yb = position.y;
                buttons[i] = new Button(xb, yb, thickness * .3); //llamamos al constructor de la clase Button
            }
        }
        void update(){ 
            //si el container es los botones de slide el translate se aplica a ellos
            //para que nunca salgan de pantalla
            if(id == "slide_L"){ 
                position.x = thickness * .5 - translation_display;
            }
            else if(id == "slide_R"){
                position.x = width - thickness/2 - translation_display;
            }
        }
        void render(){ //dibujando los containers
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
    class Hover{
        String container_id, button_type;
        int button_index;
        Hover(String c, String b, int i){
            container_id = c;
            button_type = b;
            button_index = i;
        }
    }
    Container[] containers = new Container[5]; //instanciando los container
    UI(){ //creando cada menú, con sus respectivos botones usando el constructor
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
    Hover hover(){
        String container_id, button_type;
        for(Container c : containers){
            if(pointInRect(mouseX - translation_display, mouseY, c.position.x, c.position.y, c.w, c.h)){
                container_id = c.id;
                for(int i = 0; i < c.buttons.length; i++){
                    float
                        x = c.buttons[i].position.x,
                        y = c.buttons[i].position.y,
                        r = c.buttons[i].radius;
                    if(pointInCircle(mouseX - translation_display, mouseY, x, y, r)){ 
                        button_type = c.buttons[i].type;
                        return new Hover(container_id, button_type, i);
                    } 
                }
                return new Hover(container_id, "", -1);
            }
        }
        return new Hover("", "", -1);
    }
}

// (ノಠ益ಠ)ノ彡┻━┻