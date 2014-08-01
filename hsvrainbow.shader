precision mediump float;

varying vec2 position;
uniform float time;

float makecircle(vec2 point) {
  if(distance(point, vec2(.5)) > .5) {
    return 0.0;
  }
  return 1.;
}

vec3 hsvtorgb(vec3 hsvval) {
  float hue = hsvval.x;
  float c = hsvval.z * hsvval.y; 
  float myx = c * (1. - abs(mod((hue / 60.), 2.) - 1.));
  float m = hsvval.z - c;
  vec3 myrgb;
  
  if (hue >= 0. && hue < 60.0){ 
    myrgb = vec3(c, myx, 0.0); 
  } else if (hue >= 60.0 && hue < 120.0) {
    myrgb = vec3(myx, c, 0.0); 
  } else if (hue >= 120.0 && hue < 180.0) {
    myrgb = vec3(0.0,c,myx); 
  } else if (hue >= 180.0 && hue < 240.0) {
    myrgb = vec3(0.0,myx,c); 
  } else if (hue >= 240.0 && hue < 300.0) {
    myrgb = vec3(myx,0.0,c); 
  } else if (hue >= 300.0 && hue < 360.0) {
    myrgb = vec3(c,0.0,myx); 
  }
  return myrgb;
}

float atan2(vec2 mypos) {
    //assume circle centered at 0,0
    float top = mypos.y;
    float bottom = sqrt(pow(mypos.x,2.0) + pow(mypos.y, 2.0)) + mypos.x;
    float temp = atan(top / bottom);
    return temp * 2.0;
}

void main() {
  float theta = atan2(position - vec2(.5, 0.5));
  float hue = (theta / (3.14159)) * 180.0;
  
  if(hue < 0.0) {
    hue += 360.0;
  }
  
  gl_FragColor.rgb = hsvtorgb(vec3(hue, 1.0, 1.0)) * makecircle(position);
  gl_FragColor.a = 1.;
}


