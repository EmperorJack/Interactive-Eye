PShape m_eye;
//PShape m_socket;
Shape3D m_socket;

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

  //m_socket = loadShape("socket.obj");
  //m_socket.disableStyle();
  m_socket = new Shape3D("socket.obj", "socket2.obj");
}

void draw() {
  background(0);
  
  lights();

  fill(255);
  text(frameRate, 10, 20);

  pushMatrix();
  translate(width / 2, height / 2);
  //translate(map(mouseX, 0, width, -200, 200), map(mouseY, 0, height, -200, 200));
  scale(m_scale);

  stroke(255);
  fill(c_fill);
  //noFill();
 
  pushMatrix();

  rotateY(radians(map(mouseX, 0, width, -y_rot_range * 0.6, y_rot_range * 0.6)));
  rotateX(radians(map(mouseY, 0, height, x_rot_range * 0.6, -x_rot_range * 0.6)));
  
  //shape(m_socket, 0, 0);
  m_socket.update();

  popMatrix();

  pushMatrix();

  rotateY(radians(map(mouseX, 0, width, -y_rot_range, y_rot_range)));
  rotateX(radians(map(mouseY, 0, height, x_rot_range, -x_rot_range)));
  rotateZ(frameCount / 200f);
  
  strokeWeight(1.2);
  stroke(c_stroke);

  shape(m_eye, 0, 0);

  popMatrix();

  popMatrix();
}