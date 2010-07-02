#import "Strategy.h"


@implementation Strategy
-(void)throwAProgramaticException {
	@throw [NSException exceptionWithName:@"BadException" reason:@"Ouch" userInfo:nil];    
}

-(void)throwACompilerDirectiveException {
  NSException *exception = [NSException exceptionWithName:@"BadException" reason:@"Ouch" userInfo:nil];
  [exception raise];  
}

@end
