// Author: ngoxuanhuy
// License: MIT

float check(vec2 p1, vec2 p2, vec2 p3)
{
  return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y);
}

bool PointInLozenge (vec2 pt, vec2 p1, vec2 p2, vec2 p3, vec2 p4)
{
    bool b1, b2, b3, b4;
    b1 = check(pt, p1, p2) < 0.0;
    b2 = check(pt, p2, p3) < 0.0;
    b3 = check(pt, p3, p4) < 0.0;
    b4 = check(pt, p4, p1) < 0.0;
    return ((b1 == b2) && (b2 == b3) && (b3 == b4));
}

bool in_lozenge(vec2 p){
  vec2 vertex1, vertex2, vertex3, vertex4;
  vertex1 = vec2(0.5, 0.5-progress);
  vertex2 = vec2(0.5-progress, 0.5);
  vertex3 = vec2(0.5, 0.5+progress);
  vertex4 = vec2(0.5+progress, 0.5);
  if (PointInLozenge(p, vertex1, vertex2, vertex3, vertex4))
  {
    return true;
  }
  return false;
}

float blur_edge(vec2 bot1, vec2 bot2, vec2 bot3, vec2 bot4, vec2 testPt)
{
  vec2 lineDir = bot1 - bot2;
  vec2 perpDir = vec2(lineDir.y, -lineDir.x);
  vec2 dirToPt = bot1 - testPt;
  float dist = abs(dot(normalize(perpDir), dirToPt));
  
  lineDir = bot2 - bot3;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = bot2 - testPt;
  float min_dist = min(abs(dot(normalize(perpDir), dirToPt)), dist);
  
  lineDir = bot3 - bot4;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = bot3 - testPt;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);
  
  lineDir = bot4 - bot1;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = bot4 - testPt;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);
  
  if (min_dist < 0.005) {
    return min_dist / 0.005;
  }
  else  {
    return 1.0;
  };
}

vec4 transition (vec2 uv) {
  if (in_lozenge(uv))
  {
    if (progress == 0.0)
    {
      return getFromColor(uv);
    }
    return mix(
      getFromColor(uv),
      getToColor(uv),
      blur_edge(vec2(0.5+progress, 0.5),vec2(0.5, 0.5+progress),vec2(0.5-progress, 0.5),vec2(0.5, 0.5-progress),uv)
    );
  }
  return getFromColor(uv);
}