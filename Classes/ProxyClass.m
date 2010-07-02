#import "ProxyClass.h"

@implementation ProxyClass
- (id)init {
  _strategy = [[Strategy alloc] init];
  return self;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
  [anInvocation setTarget:_strategy];
  [anInvocation invoke];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
  return [_strategy methodSignatureForSelector:aSelector];
}

-(void)dealloc {
  [_strategy release];
  [super dealloc];
}
@end
