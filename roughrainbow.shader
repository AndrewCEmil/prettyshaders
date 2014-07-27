precision mediump float;

varying vec2 position;
uniform float time;

float getbrightness(float dist) {
  return tan(dist * 2.);
}

float makecircle(vec2 point) {
  if(distance(point, vec2(.5)) > .5) {
    return 0.0;
  }
  return 1.;
}

float packColor(vec3 color) {
    return color.r + color.g * 256.0 + color.b * 256.0 * 256.0;
}

vec3 unpackColor(float f) {
    vec3 color;
    color.b = floor(f / 256.0 / 256.0);
    color.g = floor((f - color.b * 256.0 * 256.0) / 256.0);
    color.r = floor(f - color.b * 256.0 * 256.0 - color.g * 256.0);
    //normalize
    return color / 256.0;
}



void main() {
  //get dist
  float dist = distance(position, vec2(.5,.5));
  //scale to max hex value
  float hexval = floor(dist * 16777215.0 * 2.0);
  vec3 color = unpackColor(hexval);
  
  gl_FragColor.rgb = color;
  gl_FragColor.a = 1.;
}
