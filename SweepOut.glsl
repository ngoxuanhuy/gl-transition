// Author: ngoxuanhuy
// License: MIT

#define PI 3.141592653589

vec4 transition (vec2 uv) {
  if (uv.x <= 0.5)
  {
    float angle = atan(uv.y-0.5, uv.x);
    float normalizedAngle = (-angle + PI) / (2.0 * PI);
  
    normalizedAngle = normalizedAngle - floor(normalizedAngle);

    return mix(
      getFromColor(uv),
      getToColor(uv),
      step(normalizedAngle, progress)
    );
  }
  else
  {
    float angle = atan(uv.y-0.5, 1.0-uv.x);
    float normalizedAngle = (-angle + PI) / (2.0 * PI);
  
    normalizedAngle = normalizedAngle - floor(normalizedAngle);

    return mix(
      getFromColor(uv),
      getToColor(uv),
      step(normalizedAngle, progress)
    );
  }
}
