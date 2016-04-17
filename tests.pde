//void tests() {
//  m_eye_max = 0;
//  m_eye_min = Integer.MAX_VALUE;
//  for (int i = 0; i < m_eye.getVertexCount(); i++) {
//    PVector v = m_socket.getVertex(i);
//    float dist = PVector.dist(v, new PVector(0, 0, 0));
//    if (dist > m_eye_max) m_eye_max = dist;
//    if (dist < m_eye_min) m_eye_min = dist;
//  }

//  println(m_eye_max + " : " + m_eye_min);

//  //shape(m_eye, 0, 0);
//  beginShape(TRIANGLES);
//  for (int i = 0; i < m_eye.getVertexCount(); i++) {
//    PVector v = m_eye.getVertex(i);
//    println(PVector.dist(v, new PVector(0, 0, 0)));
//    stroke(map(PVector.dist(v, new PVector(0, 0, 0)) / 2, m_eye_min, m_eye_max, 255, 0));
//    vertex(v.x, v.y, v.z);
//  }
//  endShape();


//  //shape(m_socket, 0, 0);
//  beginShape(TRIANGLES);
//  for (int i = 0; i < m_socket.getVertexCount(); i++) {
//    PVector v = m_socket.getVertex(i);
//    stroke(map(PVector.dist(v, new PVector(0, 0, 0)) * m_scale, 0, 2500, 0, 255));
//    //vertex(v.x, v.y, v.z);
//  }
//  endShape();
//}