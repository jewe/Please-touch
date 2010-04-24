/* 
    Simple Particle-Demo
    Please touch / raum:station[1]
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
TuioProcessing tuioClient;

void setup()
{
  size(SCREENWIDTH, SCREENHEIGHT, OPENGL);
  frameRate(60);
  noStroke();
  fill(0);
  
  tuioClient  = new TuioProcessing(this);
  
  // init flowsource
  flowSources = new FlowSource[1];
  flowSources[0] = new FlowSource(new PVector(0,0,0), 0);
  flowSources[0].destroy(); // invisible
}

void draw()
{
  background(0);
  stroke(255);
  
  // draw flowsource
  flowSources[0].step();
  flowSources[0].draw();
}
