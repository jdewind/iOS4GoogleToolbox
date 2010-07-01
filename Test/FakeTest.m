#import "TestHelper.h"

@interface FakeTest : GTMTestCase {
  id mock;
}
@end

@implementation FakeTest

- (void) setUp {
  mock = [OCMockObject mockForClass:[NSString class]];
}

- (void) tearDown {
}

- (void) test_handles_mock_failure {
  [[mock expect] stringByAppendingString:@"hello"];
  [mock verify];
}

- (void) test_handles_hamcrest_assertions {
  assertThat(@"hello", equalTo(@"world"));
}

- (void) test_something {
  STFail(@"test something");
}

@end
