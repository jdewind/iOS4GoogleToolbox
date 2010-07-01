#import "TestHelper.h"

@interface FakeTest : GTMTestCase {
  id mock;
}
@end

@implementation FakeTest

- (void) setUp {
}

- (void) tearDown {
}

- (void) test_something {
  STFail(@"test something");
}

@end
