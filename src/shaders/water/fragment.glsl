uniform vec3 uDepthColor;
uniform vec3 uSurfaceColor;
uniform float uBigWavesElevation;
uniform float uColorOffset;
uniform float uColorMultiplier;

varying float vElevation;
varying vec2 vUv;

void main() {
    float mixStrength = (vElevation + uColorOffset) * uColorMultiplier; 
    vec2 wavedUv = vec2(
        vUv.x,
        vUv.y + sin(vUv.x * 50.0) * 0.03
    );
    float hideEdges = clamp(
        1.0 - 2.5*distance(wavedUv, vec2(0.5)),
        0.0,
        1.0
    );
    vec3 color = mix(uDepthColor, uSurfaceColor, mixStrength) * 
                 hideEdges;
    gl_FragColor = vec4(color, 1.0);
}