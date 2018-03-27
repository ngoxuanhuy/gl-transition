// Author: ngoxuanhuy
// License: MIT

//float multiple_progress = progress * 2.0;

vec4 transition (vec2 uv) 
{
    if (uv.x <= 0.5)
    {
        return mix(
            getFromColor(uv),
            getToColor(uv),
            step(1.0-uv.x, progress)
        );
    }
    else
    {
        return mix(
            getFromColor(uv),
            getToColor(uv),
            step(uv.x, progress)
        );
    }
}

/* Another solution */
// Author: ngoxuanhuy
// License: MIT

/*
bool in_bottom_right_rectangle(vec2 p)
{
    if (p.x >= 1.0-progress)
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
      step(uv.x, progress)
    );
  }
  return getFromColor(uv);
}
*/