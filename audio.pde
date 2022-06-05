//importamos las librerias de minim
import ddf.minim.*;
import ddf.minim.ugens.*;

class Audio{
    //atributos
    Minim minim;
    AudioOutput out;
    Constant freqControl;
    Gain gain;
    Oscil osc;

    Audio(){
        //constructor de los objetos Audio
        minim = new Minim(this);
        out = minim.getLineOut(Minim.MONO, 512); //salida de audio
        osc = new Oscil( 0, 1, Waves.SINE ); // oscilador
        freqControl = new Constant(0); //control de frecuencia
        //conectamos el control de frecuencia al atributo frecuencia del oscilador
        freqControl.patch( osc.frequency ); 
        gain = new Gain(0); //instancia del objeto gain para controlar la ganancia
        //conectamos el oscilador al control de ganancia y luego a la salida de audio
        osc.patch(gain).patch(out); 
    }
    
    void update(float f, float g){
        //actualizamos los valores de ganancia y frecuencia
        gain.setValue(g);
        freqControl.setConstant( f );
    }
}