precision mediump float;

varying vec2 position;
uniform float time;

vec2 rotate(vec2 start, float theta) {
    vec2 disloc = vec2(0);
    mat2 rm = mat2(cos(theta), -1. * sin(theta),
                   sin(theta), cos(theta));
    return (rm * (start - disloc)) + disloc;
}

float bgrid(vec2 pos, float radius, float centerwidth, vec2 centerpt) {
  //first we map position from [0,1] to [0,100]
  vec2 newpos = pos * 100.0;
  //next we get the poistion within the gridsquare
  vec2 modpos = mod(newpos, centerwidth);
  
  if(distance(modpos, centerpt) < radius) {
    return 1.0;
  } 
  return 0.0;
}


void main() {
  float brightness = 0.0;
  
  brightness = bgrid(position, 2.0, 20.0, vec2(2.0));
  
  brightness = brightness * abs(sin(time * 3.14159/3.));
  
  gl_FragColor.rgb = vec3(brightness);
  gl_FragColor.a = 1.;
}
