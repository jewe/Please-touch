/**
 * Simple Sound
 * 2010 Jens Weber
 * inspired by SineWaveSignal by Damien Di Fede.
 *  
 */

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;

void setup()
{
  size(600, 200);
  // setup sound
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);
}

void draw()
{
  background(0);
}

void changeFrequency(float freq)
{
  sine.setFreq(freq);
}

void mouseMoved()
{
  // set new freqency: depending on mouseX from 1500Hz - 60Hz
  float freq = map(mouseX, 0, width, 1500, 60);
  changeFrequency(freq);
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}
