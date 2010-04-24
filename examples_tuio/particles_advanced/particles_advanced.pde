/* 
    Fluid-Demo
    raum:station[01]
    Version 0.1 // 04/2010
    2010 Jens Weber
    

 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

import TUIO.*;
import processing.opengl.*;

// configuration
  int SCREENWIDTH = 1284;
  int SCREENHEIGHT = 768;
  //int SCREENWIDTH = 1920;
  //int SCREENHEIGHT = 1080;
  
FlowSource[] flowSources;
Attractor[] attractors;
TuioProcessing tuioClient;

void setup()
{
  size(SCREENWIDTH, SCREENHEIGHT, OPENGL);
  frameRate(60);
  noCursor();
  noStroke();
  fill(0);
  
  tuioClient  = new TuioProcessing(this);
  
  // init flowsources
  flowSources = new FlowSource[3];
  for (int i = 0; i < flowSources.length; i++) {
    flowSources[i] = new FlowSource(new PVector(0,0,0), 0, 1);
    flowSources[i].alive = false;
  }
  
  // init attractors
  attractors = new Attractor[3];
  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor(new PVector(0,0,0), 1);
    attractors[i].alive = false;
  }
}

void draw()
{
  background(0);
  stroke(255);
  
  // draw flowsources
  for (int i = 0; i < flowSources.length; i++) {
    flowSources[i].step();
    flowSources[i].draw();
  }
  
  // draw attractors
  for (int i = 0; i < attractors.length; i++) {
    attractors[i].draw();
  }
}
