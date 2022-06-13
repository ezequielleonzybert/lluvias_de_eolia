class AudioDrop extends Audio{
    //atributos
    Audio audio;
    ADSR adsr;
    AudioDrop(){
        audio = new Audio();
        //creamos la envolvente
        adsr = new ADSR( .25, 0.01, 0.25 );
        //conectamos el oscilador a la envolvente, luego al control de ganancia y luego a la salida de audio
        UGen out = super.osc.patch(adsr);
        out.patch(master.out);
        gain.setValue(1);
        //conectamos la variable de rotación del potenciometro a la frecuencia del audio
        super.freqControl.setConstant(ui.containers[0].buttons[1].rotation * 150 + 150);
    }
    void noteOn(){
        adsr.noteOn();
    }
}