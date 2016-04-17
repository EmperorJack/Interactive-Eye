/*
 * A class for a 3D shape which uses two obj objects and interpolates between them.
 */
class Shape3D {

  // 3D state 1
  PShape state01;

  // 3D state 2
  PShape state02;

  // Interpolated 3D state
  PShape state;

  /**
   * Setup a new 3D shape.
   */
  Shape3D(String fName01, String fName02) {
    // load the obj files
    state01 = loadShape(fName01);
    state02 = loadShape(fName02);
    state = loadShape(fName01);
    state.disableStyle();
  }

  /**
   * Update the 3D shape.
   */
  void update() {
    // interpolate vertex position values between the states depending on the volume value

    // for each vertex
    //for (int i = 0; i < state01.getVertexCount (); i++) {  
    //  // set the current state vertex to the interpolated vertex beween each state
    //  state.setVertex(i, PVector.lerp(state01.getVertex(i), state02.getVertex(i), abs(sin(frameCount / 50f))));
    //  state.getChild(i
    //}
    
    for (int i = 0; i < state01.getChildCount(); i++) {
      PShape face = state.getChild(i);
      PShape face1 = state01.getChild(i);
      PShape face2 = state02.getChild(i);
      for (int j = 0; j < 4; j++) {
        face.setVertex(j, PVector.lerp(face1.getVertex(j), face2.getVertex(j), 1 -  abs(sin(frameCount / 50f))));
      }
    }

    // draw the 3D shape
    drawShape();
  }

  /**
   * Draw the 3D shape.
   */
  void drawShape() {
    pushMatrix();

    // shape display settings
    strokeWeight(1.2);
    stroke(255);
    fill(c_fill);

    // scale the shape
    //scale(m_scale);

    shape(state);
    //beginShape(TRIANGLES);
    //for (int i = 0; i < state01.getVertexCount (); i++) {  
    //  // set the current state vertex to the interpolated vertex beween each state
    //  vertex(state.getVertex(i).x, state.getVertex(i).y, state.getVertex(i).z);
    //}
    //endShape(CLOSE);

    popMatrix();
  }
}