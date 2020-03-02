//Uncomment this following section for Android compilation.
/*import android.content.Context; 
import android.hardware.Sensor; 
import android.hardware.SensorManager; 
import android.hardware.SensorEvent; 
import android.hardware.SensorEventListener; 

Context context; 
SensorManager manager; 
Sensor sensor; 
AccelerometerListener listener; */

//Remove the defined value for Android compilation.
float ax, ay, az = 0.1;

Bubble[] bubble = new Bubble[50];

void setup() {   
  
  colorMode(HSB, 360);
  frameRate(24);
  fullScreen();   //Change to size if you want specific dimensions.
  //Uncomment the following section for Android compilation.
  /*
  context = getActivity();   
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);   
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);   
  listener = new AccelerometerListener();   
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_GAME); 
 // textFont(createFont("SansSerif", 30 * displayDensity));
*/
 

  for (int i = 0; i < bubble.length; i++) {
    bubble[i] = new Bubble(random(20, 40), random(0, 360));
    bubble[i].initpos();
  }
  
}

void draw() {
  background(0); 
  
   //Comment this next line out to remove accelerometer display
  text("X: " + ax + "\nY: " + ay + "\nZ: " + az, 0, 0, width, height);
  
  // Comment out these next few lines for Android compilation.
    ax = map(noise(mouseX,mouseY),0,1,-15,15);
    ay = map(noise(mouseY,mouseX),0,1,-15,15);
    az = map(noise(mouseX,mouseY),0,1, 20, 100);
  // Up to here.
    
  for (int i = 0; i < bubble.length; i++) {
    
    bubble[i].nsl(ax, ay, az);
    bubble[i].drawBubble(ax, ay, az);
    
    
  }
  
} 
