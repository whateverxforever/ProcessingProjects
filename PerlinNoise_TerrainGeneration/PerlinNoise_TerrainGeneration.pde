int rows,cols;
int scl=20;
int h=1800,w=1800;
float[][] terrain;
 
void setup() {
 size(600,600,P3D);
 
 rows = h / scl;
 cols = w / scl;
 
 terrain = new float[cols][rows];

 float ioff=0;
  for(int i=0; i<rows; i++){
    float joff=0;
    for(int j=0; j<cols; j++){
       terrain[j][i] = map(noise(joff,ioff),0,1,-150,150);
       joff+=0.1;
    }
    ioff+=0.1;
 }
 
}

void draw() {
  

  translate(height/2,width/2,1000);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  
  background(51);  
  
  noFill();
  stroke(255);
  
  for(int i=0; i<rows-1; i++){
    beginShape(TRIANGLE_STRIP);
    for(int j=0; j<cols; j++){
      vertex(j*scl,i*scl,terrain[j][i]);
      vertex(j*scl,(i+1)*scl,terrain[j][i+1]);
    }
    endShape();
  }  
  
}
