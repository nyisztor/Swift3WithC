//: Swift 3 Playground for using C qsort from Swift

import Foundation

var numbers = [11, 9, 1, 42, 13, 7, 0]

func quickSort( input: inout [Int] ) {
    // C-qsort
    qsort(&input, input.count, MemoryLayout<Int>.size) { (l, r) -> Int32 in
        
        if let left = l?.assumingMemoryBound(to: Int.self),
            let right = r?.assumingMemoryBound(to: Int.self) {
            
            if( left.pointee < right.pointee ) {
                return -1
            } else if ( left.pointee == right.pointee ) {
                return 0
            } else {
                return 1
            }
        }
        return 0
    }
}

print(numbers)

quickSort(input: &numbers)
print(numbers)

// With Swift 3 array algorythms
var ints = [17, 2, 5, 60, 41, 9]
ints.sort() {
    return $0 < $1
}

print(ints)
