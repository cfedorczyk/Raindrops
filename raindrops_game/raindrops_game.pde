raindrops[] raining = new raindrops[15];

void setup(){
 size (600,600);
for( int i = 0; i < raining.length; i++){
   raining[i] = new raindrops(); 
}
}
void draw(){
 for( int i = 0; i < snowing.length; i++){
   raining[i].display();
   raining[i].raining();
}
