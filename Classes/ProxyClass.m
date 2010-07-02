#import "ProxyClass.h"

#define RAISE_DIRECTLY 1

@implementation ProxyClass
- (id)init {
  _strategy = [[Strategy alloc] init];
  return self;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
#if RAISE_DIRECTLY
  [NSException raise:@"ouch" format:@""];
#else
  [anInvocation setTarget:_strategy];
  [anInvocation invoke];
#endif
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
  return [_strategy methodSignatureForSelector:aSelector];
}

-(void)dealloc {
  [_strategy release];
  [super dealloc];
}
@end
