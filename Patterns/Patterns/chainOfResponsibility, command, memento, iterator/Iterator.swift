import Foundation

class Book{
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

protocol IBookIterator {
    func hasNext() -> Bool
    func next() -> Book
}

protocol IBookEnumerable {
    var countOfBooks: Int { get }
    func take(index: Int) -> Book
    func iterator() -> IBookIterator
}

class BoolIterator: IBookIterator{
    var index: Int
    var lib: IBookEnumerable
    
    init(_lib: IBookEnumerable) {
        index = 0
        self.lib = _lib
    }
    
    func hasNext() -> Bool {
        return index < lib.countOfBooks
    }
    
    func next() -> Book {
        index += 1
        return lib.take(index: index)
    }
    
    
}

class Library: IBookEnumerable{
    var books: [Book] = []
    var countOfBooks: Int
    
    init() {
        countOfBooks = books.capacity
    }

    
    func iterator() -> IBookIterator {
        return BoolIterator(_lib: self)
    }
    
    func take(index: Int) -> Book {
        return books[index]
    }
}
