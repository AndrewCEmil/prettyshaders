precision mediump float;

varying vec2 position;
uniform float time;

void main() {
  float brightness = 0.0;

  brightness = sin(time + position.x + position.y) * .5 + .5;
  gl_FragColor.rgb = vec3(brightness);
  gl_FragColor.a = 1.;
}
