import Foundation

class Image{}

class Exercise{
    var id: Int
    var duration: Double
    var images: [Image]
    
    init(id: Int, duration: Double, imgs: [Image]) {
        self.duration = duration
        self.id = id
        self.images = imgs
    }
    
    func show(step: Int){
        if images.count > step{
            let img = images[step]
            print("Show \(step) image \(img)")
        }
    }
}

class FactoryExercise{
    
    private var _cache: [Int:Exercise] = [:]
    
    func get (id: Int) -> Exercise{
        if _cache[id] == nil{
            let ex = fetchFromServer(id: id)
            _cache[id] = ex
        }
        return _cache[id]!
    }
    
    func fetchFromServer(id: Int) -> Exercise{
        return Exercise(id: id, duration: 10, imgs: [Image(), Image(), Image()])
    }
}

class Workout{
    private var ex: Exercise
    private var step: Int
    
    init(ex: Exercise) {
        self.ex = ex
        self.step = 0
    }
    
    func doIt(){
        ex.show(step: step)
        step += 1
    }
}
