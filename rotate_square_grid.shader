precision mediump float;

varying vec2 position;
uniform float time;

vec2 rotate(vec2 start, float theta) {
    vec2 disloc = vec2(0);
    mat2 rm = mat2(cos(theta), -1. * sin(theta),
                   sin(theta), cos(theta));
    return (rm * (start - disloc)) + disloc;
}

void main() {
  vec2 rpos = rotate(position, 3.14159 * time/20.);
  //vec2 rpos = position + vec2(time/10.);

  float posx = (rpos.x * 100.0);
  float posy = (rpos.y * 100.0);
  float brightness = 0.0;
  
  if(mod(posx, 20.) < 3.) {
    if(mod(posy, 20.) < 3.) {
        brightness = 1.0;
    }
  }
  
  gl_FragColor.rgb = vec3(brightness);
  gl_FragColor.a = 1.;
}
