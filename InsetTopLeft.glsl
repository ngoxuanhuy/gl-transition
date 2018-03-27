// Author: ngoxuanhuy
// License: MIT

bool in_bottom_right_rectangle(vec2 p)
{
    if ((p.x >= 1.0-progress) && (p.y <= 0.0+progress))
    {
        return true;
    }
    return false;
}

vec4 transition (vec2 uv) 
{
  if (in_bottom_right_rectangle(uv))
  {
    return mix(
      getFromColor(uv),
      getToColor(uv),
      step(uv.y, progress)
    );
  }
  return getFromColor(uv);
}