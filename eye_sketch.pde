PShape m_eye;
PShape m_iris;
PShape m_socket;
PShape m_socket_open;
PShape m_socket_closed;

color c_stroke = color(0, 200, 255);
color c_fill = color(0);

int m_scale = 250;

float x_rot_range = 35;
float y_rot_range = 45;

float m_eye_max;
float m_eye_min;

float shut_progress = 0;
float shut_inc = 0.08;

void setup() {
  fullScreen(P3D);

  m_eye = loadShape("eye.obj");
  m_eye.disableStyle();
  
  m_iris = loadShape("iris.obj");
  m_iris.disableStyle();

  m_socket = loadShape("socket.obj");
  m_socket.disableStyle();
  m_socket_open = loadShape("socket.obj");
  m_socket_closed = loadShape("socket2.obj");
}

void update() {
  if (shut_progress > 0) {
    shut_progress -= shut_inc;
    
    if (shut_progress < 0) {
      shut_progress = 0;
    }
  }
  
  float interpolate_value = 1;
  
  if (shut_progress > 0.5) {
    interpolate_value = map(shut_progress, 0.5, 1, 1, 0);
  } else {
    interpolate_value = map(shut_progress, 0, 0.5, 0, 1);
  }
  
  for (int i = 0; i < m_socket.getChildCount(); i++) {
    PShape face = m_socket.getChild(i);
    PShape face_open = m_socket_open.getChild(i);
    PShape face_closed = m_socket_closed.getChild(i);
    for (int j = 0; j < 4; j++) {
      face.setVertex(j, PVector.lerp(face_open.getVertex(j), face_closed.getVertex(j), interpolate_value));
    }
  }
}

void draw() {
  update();

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

  shape(m_socket, 0, 0);

  popMatrix();

  pushMatrix();

  rotateY(radians(map(mouseX, 0, width, -y_rot_range, y_rot_range)));
  rotateX(radians(map(mouseY, 0, height, x_rot_range, -x_rot_range)));
  
  strokeWeight(1.2);
  stroke(c_stroke);
  
  pushMatrix(); {
    rotateZ(frameCount / 200f);
    shape(m_eye, 0, 0);
  } popMatrix();
  
  pushMatrix(); {
    rotateZ(-frameCount / 200f);
    shape(m_iris, 0, 0);
  } popMatrix();

  popMatrix();

  popMatrix();
}

void mouseClicked() {
  if (shut_progress == 0) {
    shut_progress = 1;
  }
}