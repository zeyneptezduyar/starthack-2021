import 'dart:math' show Random;
  
void main() {
  var weight = 70;
  var calories = 500;
  getActivities(weight, calories);
  
}

List<String> getActivities(int weight, int calories) {
  var activities = {'running': 7, 'swimming': 6.5, 'of burpees': 10, 'of pushups': 8, 'cycling': 5,
                    'dancing': 6, 'fishing': 1, 'of playing trombone': 0.5, 'walking': 3,
                    'of squats': 6.1, 'of lunges': 6.3};

  var rand = new Random();
  var keys = activities.keys.toList();
  
  List<String> result = [];
  List<int> chosen = [];
  
  for (var i = 0; i < 3; i++) {
    var number = rand.nextInt(11);
    while (chosen.contains(number)) {
      number = rand.nextInt(11);
    }
    chosen.add(number);
    
    var name = keys[number];
    var met = activities[name];
    var minutes = (calories * 200) / (met * 3.5 * weight);

    result.add(minutes.round().toString() + ' minutes ' + name);
  }

  return result;
}