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

float bgrid_fade(vec2 pos, float radius, float centerwidth, vec2 centerpt) {
  //first we map position from [0,1] to [0,100]
  vec2 newpos = pos * 100.0;
  //next we get the poistion within the gridsquare
  vec2 modpos = mod(newpos, centerwidth);

  if(distance(modpos, centerpt) < radius) {
    return 1.2 - (distance(modpos, centerpt) / radius);
  }
  return 0.0;
}


void main() {
  float brightness = 0.0;

  brightness = bgrid_fade(position, 3., 10., vec2(5.0));
  vec2 posnew = rotate(position + .5, time / 10.);
  posnew = posnew + time/100.;
  brightness = brightness * bgrid_fade(posnew, 3.0, 10.0, vec2(5.0));
  
  gl_FragColor.rgb = vec3(brightness);
  gl_FragColor.a = 1.;
}
