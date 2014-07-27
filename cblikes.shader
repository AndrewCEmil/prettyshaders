precision mediump float;

varying vec2 position;

void main() {
  
  float bar = abs(tan(position.x * 3.14159 *1.)/5.);
  
  gl_FragColor.rgb = vec3(bar);
  gl_FragColor.a = 1.;
}

