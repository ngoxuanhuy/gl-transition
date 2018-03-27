// Author: ngoxuanhuy
// License: MIT

vec4 transition (vec2 uv) 
{
    return mix(
        getFromColor(uv),
        getToColor(uv),
        step(uv.x, progress)
    );
}