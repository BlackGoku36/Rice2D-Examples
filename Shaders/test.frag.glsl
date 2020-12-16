#version 450

in vec4 color;
uniform float time;
out vec4 FragColor;


void main() {
    float r = sin(time);
    float g = cos(time);
    float b = sin(time) * cos(time);
    FragColor = vec4(r, g, b, 1);
}
