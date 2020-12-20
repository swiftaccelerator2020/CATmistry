#import "FirebaseDatabase/Sources/third_party/FImmutableSortedDictionary/FImmutableSortedDictionary/FTreeSortedDictionary.h"
#import <Foundation/Foundation.h>

@interface FTreeSortedDictionaryEnumerator : NSEnumerator

- (id)initWithImmutableSortedDictionary:(FTreeSortedDictionary *)aDict
    startKey:(id)startKey
    isReverse:(BOOL)reverse;
- (id)nextObject;

@end
