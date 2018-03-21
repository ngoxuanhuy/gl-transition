// Author: huynx
// License: MIT

vec2 bottom_left = vec2(0.0, 1.0);
vec2 bottom_right = vec2(1.0, 1.0);
vec2 top_left = vec2(0.0, 0.0);
vec2 top_right = vec2(1.0, 0.0);
vec2 center = vec2(0.5, 0.5);

float check(vec2 p1, vec2 p2, vec2 p3)
{
  return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y);
}

bool PointInTriangle (vec2 pt, vec2 p1, vec2 p2, vec2 p3)
{
    bool b1, b2, b3;
    b1 = check(pt, p1, p2) < 0.0;
    b2 = check(pt, p2, p3) < 0.0;
    b3 = check(pt, p3, p1) < 0.0;
    return ((b1 == b2) && (b2 == b3));
}

bool in_left_triangle(vec2 p){
  if (PointInTriangle(p, top_left, bottom_left, center))
  {
    return true;
  }
  return false;
}

bool in_right_triangle(vec2 p){
  if (PointInTriangle(p, top_right, bottom_right, center))
  {
    return true;
  }
  return false;
}

bool in_top_triangle(vec2 p)
{
  if (PointInTriangle(p, top_left, top_right, center))
  {
    return true;
  }
  return false;
}

bool in_bottom_triangle(vec2 p)
{
  if (PointInTriangle(p, bottom_left, bottom_right, center))
  {
    return true;
  }
  return false;
}

vec4 transition (vec2 uv) {
    if (in_left_triangle(uv))
    {
      return mix(
        getFromColor(uv),
        getToColor(uv),
        step(uv.x, progress)
      );  
    }
    if (in_right_triangle(uv))
    {
      return mix(
        getFromColor(uv),
        getToColor(uv),
        step(1.0 - uv.x, progress)
      );    
    }
    if (in_top_triangle(uv))
    {
      return mix(
        getFromColor(uv),
        getToColor(uv),
        step(uv.y, progress)
      );
    }
    if (in_bottom_triangle(uv))
    {
      return mix(
        getFromColor(uv),
        getToColor(uv),
        step(1.0 - uv.y, progress)
      );
    }
}


















