// Author: ngoxuanhuy
// License: MIT

#define PI 3.141592653589

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

bool in_top_triangle(vec2 p)
{
  vec2 top1, top2, top3, top4, top5, top6;
  vec2 bot1, bot2, bot3, bot4, bot5, bot6, bot7;
  top1 = vec2(0.0, 0.5+progress);
  top2 = vec2(0.2, 0.5+progress);
  top3 = vec2(0.4, 0.5+progress);
  top4 = vec2(0.6, 0.5+progress);
  top5 = vec2(0.8, 0.5+progress);
  top6 = vec2(1.0, 0.5+progress);
  
  bot1 = vec2(0.0, 0.6+progress);
  bot2 = vec2(0.1, 0.6+progress);
  bot3 = vec2(0.3, 0.6+progress);
  bot4 = vec2(0.5, 0.6+progress);
  bot5 = vec2(0.7, 0.6+progress);
  bot6 = vec2(0.9, 0.6+progress);
  bot7 = vec2(1.0, 0.6+progress);
  
  if (PointInTriangle(p, top1, bot1, bot2)) return true;
  if (PointInTriangle(p, top2, bot2, bot3)) return true;
  if (PointInTriangle(p, top3, bot3, bot4)) return true;
  if (PointInTriangle(p, top4, bot4, bot5)) return true;
  if (PointInTriangle(p, top5, bot5, bot6)) return true;
  if (PointInTriangle(p, top6, bot6, bot7)) return true;
  return false;
}

bool in_bottom_triangle(vec2 p)
{
  vec2 top1, top2, top3, top4, top5;
  vec2 bot1, bot2, bot3, bot4, bot5, bot6;
  
  top1 = vec2(0.1, 0.5-progress);
  top2 = vec2(0.3, 0.5-progress);
  top3 = vec2(0.5, 0.5-progress);
  top4 = vec2(0.7, 0.5-progress);
  top5 = vec2(0.9, 0.5-progress);

  bot1 = vec2(0.0, 0.4-progress);
  bot2 = vec2(0.2, 0.4-progress);
  bot3 = vec2(0.4, 0.4-progress);
  bot4 = vec2(0.6, 0.4-progress);
  bot5 = vec2(0.8, 0.4-progress);
  bot6 = vec2(1.0, 0.4-progress);
  
  if (PointInTriangle(p, top1, bot1, bot2)) return true;
  if (PointInTriangle(p, top2, bot2, bot3)) return true;
  if (PointInTriangle(p, top3, bot3, bot4)) return true;
  if (PointInTriangle(p, top4, bot4, bot5)) return true;
  if (PointInTriangle(p, top5, bot5, bot6)) return true;
  return false;
}

float min_distance(vec2 p)
{
  vec2 top1, top2, top3, top4, top5;
  vec2 bot1, bot2, bot3, bot4, bot5, bot6;
  top1 = vec2(0.1, 0.5+progress);
  top2 = vec2(0.3, 0.5+progress);
  top3 = vec2(0.5, 0.5+progress);
  top4 = vec2(0.7, 0.5+progress);
  top5 = vec2(0.9, 0.5+progress);
  
  bot1 = vec2(0.0, 0.6+progress);
  bot2 = vec2(0.2, 0.6+progress);
  bot3 = vec2(0.4, 0.6+progress);
  bot4 = vec2(0.6, 0.6+progress);
  bot5 = vec2(0.8, 0.6+progress);
  bot6 = vec2(1.0, 0.6+progress);
  
  vec2 lineDir = top1 - bot1;
  vec2 perpDir = vec2(lineDir.y, -lineDir.x);
  vec2 dirToPt = top1 - p;
  float dist = abs(dot(normalize(perpDir), dirToPt));
  
  lineDir = top1 - bot2;
  perpDir = vec2(lineDir.y, -lineDir.x);
  float min_dist = min(abs(dot(normalize(perpDir), dirToPt)), dist);

  lineDir = top2 - bot2;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top2 - p;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top2 - bot3;
  perpDir = vec2(lineDir.y, -lineDir.x);
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top3 - bot3;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top3 - p;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top3 - bot4;
  perpDir = vec2(lineDir.y, -lineDir.x);
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top4 - bot4;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top4 - p;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top4 - bot5;
  perpDir = vec2(lineDir.y, -lineDir.x);
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top5 - bot5;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top5 - p;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top5 - bot6;
  perpDir = vec2(lineDir.y, -lineDir.x);
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  top1 = vec2(0.1, 0.5-progress);
  top2 = vec2(0.3, 0.5-progress);
  top3 = vec2(0.5, 0.5-progress);
  top4 = vec2(0.7, 0.5-progress);
  top5 = vec2(0.9, 0.5-progress);

  bot1 = vec2(0.0, 0.4-progress);
  bot2 = vec2(0.2, 0.4-progress);
  bot3 = vec2(0.4, 0.4-progress);
  bot4 = vec2(0.6, 0.4-progress);
  bot5 = vec2(0.8, 0.4-progress);
  bot6 = vec2(1.0, 0.4-progress);

  lineDir = top1 - bot1;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top1 - p;
  dist = abs(dot(normalize(perpDir), dirToPt));
  
  lineDir = top1 - bot2;
  perpDir = vec2(lineDir.y, -lineDir.x);
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), dist);

  lineDir = top2 - bot2;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top2 - p;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top2 - bot3;
  perpDir = vec2(lineDir.y, -lineDir.x);
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top3 - bot3;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top3 - p;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top3 - bot4;
  perpDir = vec2(lineDir.y, -lineDir.x);
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top4 - bot4;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top4 - p;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top4 - bot5;
  perpDir = vec2(lineDir.y, -lineDir.x);
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top5 - bot5;
  perpDir = vec2(lineDir.y, -lineDir.x);
  dirToPt = top5 - p;
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);

  lineDir = top5 - bot6;
  perpDir = vec2(lineDir.y, -lineDir.x);
  min_dist = min(abs(dot(normalize(perpDir), dirToPt)), min_dist);
  
  return min_dist;
}

vec4 transition (vec2 uv) {
  if (progress == 0.0)
  {
    return getFromColor(uv);
  }
  if (uv.y >= 0.6+progress)
  {
    return getFromColor(uv);
  }
  if (uv.y <= 0.4-progress)
  {
    return getFromColor(uv);
  }
  if (uv.y <= 0.5+progress && uv.y >= 0.5-progress)
  {
    return getToColor(uv);
  }
  if (in_top_triangle(uv) || in_bottom_triangle(uv))
  {
    return getFromColor(uv);
  }
  // float distance = min_distance(uv);
  // if (distance <= 0.005)
  // {
  //   return mix(
  //     getFromColor(uv),
  //     getToColor(uv),
  //     distance / 0.005);
  // }
  return getToColor(uv);
}
