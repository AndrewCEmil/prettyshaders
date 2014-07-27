precision mediump float;

varying vec2 position;
uniform float time;

vec2 rotate(vec2 start, float theta) {
    vec2 disloc = vec2(.5);
    mat2 rm = mat2(cos(theta), -1. * sin(theta),
                   sin(theta), cos(theta));
    return (rm * (start - disloc)) + disloc;
}

float makecircle(vec2 point) {
  if(distance(point, vec2(.5)) > .5) {
    return 0.0; 
  }
  return 1.;
}

void main() {
  
  vec2 rpos = rotate(position, 3.14159 * time/5.);
  float xrotate = abs(rpos.x);
  
  vec2 mytan = abs(tan(rpos * 3.14159 * 1.)/3.);
  
  float tanavg = (mytan.x * mytan.y)/5.;

  float cb = makecircle(position);
  float finaltan = cb * tanavg;
  
  gl_FragColor.rgb = vec3(finaltan);
  gl_FragColor.a = 1.;
}

