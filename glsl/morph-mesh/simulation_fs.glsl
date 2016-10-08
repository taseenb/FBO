
// simulation
uniform sampler2D textureA;
uniform sampler2D textureB;
uniform float timer;

varying vec2 vUv;

void main() {

   //origin
   vec4 origin  = texture2D( textureA, vUv ).xyzw;

   //destination
   vec4 destination = texture2D( textureB, vUv ).xyzw;

   //lerp
   vec4 pos = mix( origin, destination, timer );

   gl_FragColor = vec4( pos.xyz, pos.w );

}