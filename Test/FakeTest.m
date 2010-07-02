#import "TestHelper.h"
#import "ProxyClass.h"

@interface FakeTest : GTMTestCase {
  id mock;
  id fakeObject;
}
@end

@implementation FakeTest

- (void) setUp {
  mock = [OCMockObject mockForClass:[NSString class]];
  fakeObject = [[[ProxyClass alloc] init] autorelease];
}

- (void) tearDown {
}

- (void) test_handles_mock_failure {
  [mock  stringByAppendingString:@"hello"];
  [mock verify];
}

-(void)test_proxy_and_strategy_object_invocation {
  Strategy *strategy = [[[Strategy alloc] init] autorelease];
  id proxyClass = [[[ProxyClass alloc] init] autorelease];
  
  @try {
    [strategy throwAProgramaticException];
  }
  @catch (NSException * e) {
    NSLog(@"Caught strategy object exception");
  }
  
  @try {
    [proxyClass throwAProgramaticException];
  }
  @catch (NSException * e) {
    NSLog(@"This should not be caught");
  }
}

-(void)test_catches_compiler_directive_throw {
  [fakeObject throwAProgramaticException];
}

-(void)test_catches_programatic_throw {
  [fakeObject throwACompilerDirectiveException];
}

- (void) test_handles_hamcrest_assertions {
  assertThat(@"hello", equalTo(@"world"));
}

- (void) test_something {
  STFail(@"test something");
}

- (void) test_catch_and_handle_strategy_object_exceptions {
  Strategy *strategy = [[[Strategy alloc] init] autorelease];
 	NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[Strategy class] instanceMethodSignatureForSelector:@selector(throwAProgramaticException)]];
  [invocation setTarget:strategy];
  [invocation setSelector:@selector(throwAProgramaticException)];
  
  @try {
    objc_msgSend(strategy, [invocation selector]);
    [invocation invoke];
  }
  @catch (NSException * e) {
    NSLog(@"Caught programatic exception");
  }
  
  invocation = [NSInvocation invocationWithMethodSignature:[[Strategy class] instanceMethodSignatureForSelector:@selector(throwACompilerDirectiveException)]];
  [invocation setTarget:strategy];
  [invocation setSelector:@selector(throwAProgramaticException)];
  
  @try {
    [invocation invoke];
  }
  @catch (NSException * e) {
    NSLog(@"Caught compiler exception");
  }
  
  
}
@end
