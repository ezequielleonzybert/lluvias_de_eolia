//importamos las librerias de minim
import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;

class Audio{
    Minim minim;
    AudioOutput out;
    Oscil osc;
    Gain gain;
    Constant freqControl;
    //creamos un objeto fft para analizar el audio y representarlo en la escena 3 con imágenes
    FFT fft;
    Audio(){
        minim = new Minim(this);
        //salida de audio. Cuanto mayor samplerate, el detalle del analisis va a ser mayor,
        //pero en algunos computadores puede afectar el rendimiento del sonido.
        out = minim.getLineOut(Minim.MONO, 2048);
        osc = new Oscil( 0, 1, Waves.SINE ); // oscilador
        freqControl = new Constant(0); //control de frecuencia
        //conectamos el control de frecuencia al atributo frecuencia del oscilador
        freqControl.patch( osc.frequency ); 
        gain = new Gain(0); //instancia del objeto gain para controlar la ganancia
        //creamos la instancia de fft con los argumentos tamaño del bufer y sample rate
        fft = new FFT(out.bufferSize(), 2048);
    }
    void analysis(){ //función para analizar y dibujar el audio
        //realizamos el analisis de frecuencias sobre la salida out con el método forward de fft
        fft.forward(out.mix);
        //los sonidos utilizados en esta app no cubren todo el espectro, especialmente no
        ///se utilizan muchos agudos, por lo que reducimos el número de iteraciones del for()
        //a un máximo
        float max = floor(fft.specSize()/18);
         //con el for() dibujamos lineas con los resultados obtenidos de forward 
        for(int i = 0; i < max; i++){            
            //el método getBand(n) nos devuelve la amplitud de la banda de frecuencia n.
            float bandAmp = fft.getBand(i);
            stroke(255);
            strokeWeight(2);
            line( i*width/max - width , height, i*width/max - width, height - bandAmp * 1.5);

        //circulito flashero
            strokeWeight(2);
            float 
                x = width / 2 - width,
                y = height / 2,
                pot1 = ui.containers[2].buttons[0].rotation,
                pot2 = ui.containers[2].buttons[1].rotation,
                r = pot1 * 50,
                dirX = cos(i*TWO_PI/max),
                dirY = sin(i*TWO_PI/max),
                x0 = dirX,
                y0 = dirY;
            push();
            translate(x,y);
            rotate((float)frameCount/200);
            line(x0*r, y0*r, x0*r + bandAmp*dirX, y0*r + bandAmp*dirY);
            r *= .5;
            rotate((float)frameCount/200);
            line(x0*r, y0*r, x0*r + bandAmp*dirX/10, y0*r + bandAmp*dirY/10);
            pop();
        }
    }
}