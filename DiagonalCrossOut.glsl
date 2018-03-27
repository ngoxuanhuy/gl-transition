// Author: ngoxuanhuy
// License: MIT

float check(vec2 p1, vec2 p2, vec2 p3)
{
  return (p1.x - p3.x) * (p2.y - p3.y) - (p1.y - p3.y) * (p2.x - p3.x);
}

bool PointInTriangle (vec2 pt, vec2 p1, vec2 p2, vec2 p3)
{
    bool b1, b2, b3;
    b1 = check(pt, p1, p2) < 0.0;
    b2 = check(pt, p2, p3) < 0.0;
    b3 = check(pt, p3, p1) < 0.0;
    return ((b1 == b2) && (b2 == b3));
}

bool in_top_triangle(vec2 p){
  vec2 vertex1, vertex2, vertex3;
  vertex1 = vec2(0.5, 0.5-progress);
  vertex2 = vec2(0.0+progress, 0.0);
  vertex3 = vec2(1.0-progress, 0.0);
  if (PointInTriangle(p, vertex1, vertex2, vertex3))
  {
    return true;
  }
  return false;
}

bool in_bottom_triangle(vec2 p){
  vec2 vertex1, vertex2, vertex3;
  vertex1 = vec2(0.5, 0.5 + progress);
  vertex2 = vec2(0.0+progress, 1.0);
  vertex3 = vec2(1.0-progress, 1.0);
  if (PointInTriangle(p, vertex1, vertex2, vertex3))
  {
    return true;
  }
  return false;
}

bool in_left_triangle(vec2 p)
{
  vec2 vertex1, vertex2, vertex3;
  vertex1 = vec2(0.5-progress, 0.5);
  vertex2 = vec2(0.0, 0.0+progress);
  vertex3 = vec2(0.0, 1.0-progress);
  if (PointInTriangle(p, vertex1, vertex2, vertex3))
  {
    return true;
  }
  return false;
}

bool in_right_triangle(vec2 p)
{
  vec2 vertex1, vertex2, vertex3;
  vertex1 = vec2(0.5+progress, 0.5);
  vertex2 = vec2(1.0, 0.0+progress);
  vertex3 = vec2(1.0, 1.0-progress);
  if (PointInTriangle(p, vertex1, vertex2, vertex3))
  {
    return true;
  }
  return false;
}

float min_distance(vec2 p)
{
  vec2 top_left_1, top_left_2, top_right_1, top_right_2;
  vec2 bottom_left_1, bottom_left_2, bottom_right_1, bottom_right_2;
  
  top_left_1 = vec2(0.0, 1.0-progress);
  top_left_2 = vec2(0.0+progress, 1.0);
  top_right_1 = vec2(1.0-progress,1.0);
  top_right_2 = vec2(1.0, 1.0-progress);
  bottom_right_1 = vec2(1.0, 0.0+progress);
  bottom_right_2 = vec2(1.0-progress, 0.0);
  bottom_left_1 = vec2(0.0+progress, 0.0);
  bottom_left_2 = vec2(0.0, 0.0+progress);
  
  vec2 lineDir = top_left_1 - bottom_right_2;
  vec2 perpDir = vec2(lineDir.y, -lineDir.x);
  vec2 dirToPt = top_left_1 - p;
  float dist = abs(dot(normalize(perpDir), dirToPt));
  
  lineDir = top_left_2 - bottom_right_1;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top_left_2 - p;
  float min_dist = min(abs(dot(normalize(perpDir), dirToPt)), dist);

  lineDir = top_right_1 - bottom_left_2;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top_right_1 - p;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top_right_2 - bottom_left_1;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top_right_2 - p;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);
  
  return min_dist;
}

vec4 transition (vec2 uv) {
  float distance = min_distance(uv);
  if (progress == 0.0)
  {
    return getFromColor(uv);
  }
  if (in_top_triangle(uv))
  {
    if (distance <= 0.005)
    {
      return mix(
        getToColor(uv),
        getFromColor(uv),
        distance/0.005);
    }
    return getFromColor(uv);
  }
  if (in_bottom_triangle(uv))
  {
    if (distance <= 0.005)
    {
      return mix(
        getToColor(uv),
        getFromColor(uv),
        distance/0.005);
    }
    return getFromColor(uv);
  }
  if (in_left_triangle(uv))
  {
    if (distance <= 0.005)
    {
      return mix(
        getToColor(uv),
        getFromColor(uv),
        distance/0.005);
    }
    return getFromColor(uv);
  }
  if (in_right_triangle(uv))
  {
    if (distance <= 0.005)
    {
      return mix(
        getToColor(uv),
        getFromColor(uv),
        distance/0.005);
    }
    return getFromColor(uv);
  }
  return getToColor(uv);
}