DHToast
===============

<p align="center"><img src="http://i.imgur.com/tu9tBWk.gif"/></p>

A simple quick toast message. If you just need to pop a small message in any view. Check definitions in the header for defaults.

##Usage
Basic use is to import the header and call the class method
```objc
#import "DHToast.h"

[DHToast showInView:self.view withMessage:@"Toast Message" animated:YES];
```
To dismiss call
```objc
[DHToast dismissAllOverlaysForView:self.view animated:YES];
```

##Author

Dillon Hoa

## Licence

MIT 





