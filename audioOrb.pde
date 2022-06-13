class AudioOrb extends Audio{
    //atributos
    Audio audio;

    AudioOrb(){
        //constructor de los objetos Audio
        audio = new Audio();        
        //conectamos el oscilador al control de ganancia y luego a la salida de audio
        UGen out = super.osc.patch(super.gain);
        out.patch(master.out);
    }
    
    void update(float f, float g){
        //actualizamos los valores de ganancia y frecuencia
        gain.setValue(g);
        freqControl.setConstant( f );
    }
}