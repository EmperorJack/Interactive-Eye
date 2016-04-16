
PShape m_eye;
PShape m_socket;

color c_stroke = color(0, 200, 255);
color c_fill = color(0);

int m_scale = 250;

float x_rot_range = 35;
float y_rot_range = 45;

float m_eye_max;
float m_eye_min;

void setup() {
  fullScreen(P3D);

  m_eye = loadShape("eye.obj");
  m_eye.disableStyle();

  m_socket = loadShape("socket.obj");
  m_socket.disableStyle();
}

void draw() {
  background(0);

  fill(255);
  text(frameRate, 10, 20);

  pushMatrix();
  translate(width / 2, height / 2);
  //translate(map(mouseX, 0, width, -200, 200), map(mouseY, 0, height, -200, 200));
  scale(m_scale);

  stroke(c_stroke);
  strokeWeight(2);
  fill(c_fill);
  //noFill();

  pushMatrix();

  rotateY(radians(map(mouseX, 0, width, -y_rot_range * 0.65, y_rot_range * 0.65)));
  rotateX(radians(map(mouseY, 0, height, x_rot_range * 0.65, -x_rot_range * 0.65)));
  
  shape(m_socket, 0, 0);

  popMatrix();

  pushMatrix();

  rotateY(radians(map(mouseX, 0, width, -y_rot_range, y_rot_range)));
  rotateX(radians(map(mouseY, 0, height, x_rot_range, -x_rot_range)));
  rotateZ(frameCount / 200f);

  shape(m_eye, 0, 0);

  popMatrix();

  popMatrix();
}