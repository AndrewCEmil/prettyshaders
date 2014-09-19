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
  float brightness = 0.0;
  
  vec2 modpos = mod(position * 100., 20.);
  
  if(distance(modpos, vec2(2., 2.)) < 2.) {
    brightness = 1.0;
  }
  
  brightness = brightness * abs(sin(time * 3.14159/3.));

  
  gl_FragColor.rgb = vec3(brightness);
  gl_FragColor.a = 1.;
}
