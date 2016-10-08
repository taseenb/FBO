
//float texture containing the positions of each particle
uniform sampler2D positions;
uniform float alpha;

varying float a;
uniform float pointSize;

//size
//uniform vec2 nearFar;
////varying float size;
//
//#define EPSILON 1e-6
//#ifdef USE_LOGDEPTHBUF
//	#ifdef USE_LOGDEPTHBUF_EXT
//		varying float vFragDepth;
//	#endif
//	uniform float logDepthBufFC;
//#endif

void main() {

    //the mesh is a normalized square so the uvs = the xy positions of the vertices
    vec4 pos = texture2D( positions, position.xy ).xyzw;

    a = pos.w;

    //pos now contains the position of a point in space that can be transformed
    gl_Position = projectionMatrix * modelViewMatrix * vec4( pos.xyz, 1.0 );

//    #ifdef USE_LOGDEPTHBUF
//            gl_Position.z = log2(max( EPSILON, gl_Position.w + 1.0 )) * logDepthBufFC;
//
//            #ifdef USE_LOGDEPTHBUF_EXT
//                vFragDepth = 1.0 + gl_Position.w;
//            #else
//                gl_Position.z = (gl_Position.z - 1.0) * gl_Position.w;
//            #endif
//        #endif

    gl_PointSize = pointSize;

//float depth = 1.0 - smoothstep( nearFar.x, nearFar.y, gl_Position.z / gl_Position.w );
//    // gl_PointSize = size = depth * pointSize;
//    gl_PointSize = depth * pointSize;
}