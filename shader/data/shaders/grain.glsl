#define PROCESSING_TEXTURE_SHADER

in vec2 texcoord; // Texture coordinates from the vertex shader

layout(location = 0) out vec3 out_color;

uniform sampler2D colorMap; // This is the original image without noise
uniform float time; // Time since the start of the frame

const float noiseStrength = 30.0; // The strength of the noise effect

void main()
{
    out_color = texture(colorMap, texcoord).xyz;
    float x = (texcoord.x + 4) * (texcoord.y + 4) * (time * 10);
    vec3 grain = vec3(mod(mod(x, 13) + 1) * (mod(x, 123) + 1), 0.01) - 0.005 * noiseStrength;

    // This one is optional, it makes a small "tear" every now and then
    if(mod(time, 100) > 98 && mod(texcoord.y, 10) > 7) grain = vec3(-3.0, -3.0, -3.0);

    out_color += grain;
}