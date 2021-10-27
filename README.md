####Step 1:　
Install a controller.

```dart
	 final controller = OverlapTransitionController();
```

####Step 2:　
import the dependency.
```dart
import 'package:overlap_transition/overlap_transition.dart';
```

####Step 3:　
Add widgets OverlapTransition
```dart
 return OverlapTransition(
      duration: Duration(seconds: 1),
      curves: Curves.decelerate,
  
      overlapTransitionController: controller,
      primary: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => controller.forward(),
            child: Text("Next"),
          ),
        ),
      ),
      secundary: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => controller.reverse(),
            child: Text("Back"),
          ),
        ),
      ),
    );
```
- primary
	Fist wdiget
	
- secundary 
	Widget overlap 
	
	
	
