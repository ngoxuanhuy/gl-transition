// Author: ngoxuanhuy
// License: MIT

bool in_top_left_rectangle(vec2 p)
{
    if ((p.x <= 0.5-progress/2.0) && (p.y >= 0.5+progress/2.0))
    {
        return true;
    }
    return false;
}

bool in_top_right_rectangle(vec2 p)
{
    if ((p.x >= 0.5+progress/2.0) && (p.y >= 0.5+progress/2.0))
    {
        return true;
    }
    return false;
}

bool in_bottom_left_rectangle(vec2 p)
{
    if ((p.x <= 0.5-progress/2.0) && (p.y <= 0.5-progress/2.0))
    {
        return true;
    }
    return false;
}

bool in_bottom_right_rectangle(vec2 p)
{
    if ((p.x >= 0.5+progress/2.0) && (p.y <= 0.5-progress/2.0))
    {
        return true;
    }
    return false;
}

vec4 transition (vec2 uv) 
{
    if (in_top_left_rectangle(uv))
    {
      return mix(
        getFromColor(uv),
        getToColor(uv),
        step(1.0-uv.x, progress)
      );
    }
    if (in_top_right_rectangle(uv))
    {
      return mix(
        getFromColor(uv),
        getToColor(uv),
        step(uv.x, progress)
      );
    }
    if (in_bottom_left_rectangle(uv))
    {
      return mix(
        getFromColor(uv),
        getToColor(uv),
        step(1.0-uv.x, progress)
      );
    }
    if (in_bottom_right_rectangle(uv))
    {
      return mix(
        getFromColor(uv),
        getToColor(uv),
        step(1.0-uv.y, progress)
      );
    }
    return getToColor(uv);
}