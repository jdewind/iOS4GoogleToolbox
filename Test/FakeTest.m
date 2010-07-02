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

@end
