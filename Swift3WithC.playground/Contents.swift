//: Swift 3 Playground for using C qsort from Swift

import Foundation

var numbers = [11, 9, 1, 42, 13, 7, 0]

func quickSort( input: inout [Int] ) -> [Int] {
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
    
    return input
}

print(numbers)
print(quickSort(input: &numbers))

