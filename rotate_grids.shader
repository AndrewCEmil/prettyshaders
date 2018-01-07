//This GLSL shader displays what happens when you take two grids of circles
//and rotate one on top of the other.  A simple piece of code with a mesmerizing
//result.
precision mediump float;

varying vec2 position;
uniform float time;

//Returns a 2x2 rotation matrix that rotates a point theta degrees around 0
mat2 rotation_matrix(float theta) {
  return mat2(cos(theta), -1. * sin(theta),
              sin(theta), cos(theta));
}

//Rotates a point theta degrees around 0
vec2 rotate(vec2 start, float theta) {
  return (rotation_matrix(theta) * (start));
}

//Creates a grid of circles
//Returns 1 when pos is in a circle, 0 when not
//grid_width is the size of each grid square, radius is the size of each circle
float grid(vec2 pos, float radius, float grid_width) {
  if(distance(mod(pos, grid_width), vec2(grid_width/2.)) < radius) {
    return 1.;
  }
  return 0.;
}

void main() {
  float radius = 0.03;
  float grid_width = 0.1;
  float speed = 0.1;

  //Get unrotated grid value
  float brightness = grid(position, radius, grid_width);
  //AND with grid rotated time*speed degrees
  brightness *= grid(rotate(position, time * speed), radius, grid_width);
  //brightness == 1 iff we are in a circle in both grids

  gl_FragColor.rgba = vec4(vec3(brightness), 1.);
}
