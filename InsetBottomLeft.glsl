// Author: ngoxuanhuy
// License: MIT

bool in_top_right_rectangle(vec2 p)
{
    if ((p.x >= 1.0-progress) && (p.y >= 1.0-progress))
    {
        return true;
    }
    return false;
}

vec4 transition (vec2 uv) 
{
  if (in_top_right_rectangle(uv))
  {
    return mix(
      getFromColor(uv),
      getToColor(uv),
      step(1.0-uv.x, progress)
    );
  }
  return getFromColor(uv);
}