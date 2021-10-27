![1](https://user-images.githubusercontent.com/45492072/139143592-584aa675-da96-4b75-bc62-037d07c9711a.png)
![2](https://user-images.githubusercontent.com/45492072/139143595-543ae28e-107d-427f-98e7-fca70d05bd83.png)


#### Step 1:　
Install a controller.

```dart
	 final controller = OverlapTransitionController();
```

#### Step 2:　
import the dependency.
```dart
import 'package:overlap_transition/overlap_transition.dart';
```

#### Step 3:　
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
	
	
	
