#import <Foundation/Foundation.h>
#import "Strategy.h"

@interface ProxyClass : NSProxy {
	@private
  
  Strategy *_strategy;
}

@end
