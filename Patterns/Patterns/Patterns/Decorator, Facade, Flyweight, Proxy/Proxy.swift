import Foundation

class Video{}

protocol IDownloder {
    func download(url: String) -> Video
}

class YouTubeDownloader: IDownloder{
    func download(url: String) -> Video {
        print("Downloading...")
        return Video()
    }
}

class CachedDownloader: IDownloder{
    private var downloader: IDownloder
    private var _cache: [String:Video] = [:]
    
    init(downloader: IDownloder) {
        self.downloader = downloader
    }
    
    func setDownloader(to: IDownloder){
        downloader = to
    }
    
    func download(url: String) -> Video {
        var v: Video
        
        if _cache[url] == nil{
            v = (downloader.download(url: url))
            _cache[url] = v
        }
        
        return _cache[url]!
    }
}
