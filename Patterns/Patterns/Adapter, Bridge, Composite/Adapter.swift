import Foundation

class JsonObject{}

protocol IJsonService{
    func getData(queryData: JsonObject) -> JsonObject
}

class JsonService: IJsonService{
    func getData(queryData: JsonObject) -> JsonObject {
        return queryData
    }
}

class XmlObject {}

protocol IXmlService {
    func getParams(queryData: XmlObject) -> XmlObject
}

class XmlService: IXmlService{
    func getParams(queryData: XmlObject) -> XmlObject {
        return queryData
    }
}

class XmlToJsonAdapter: IJsonService{
    var _srvice: IXmlService
    
    init(service: IXmlService) {
        _srvice = service
    }
    
    func XmlToJson(xmlObject: XmlObject) -> JsonObject{
        return JsonObject()
    }
    
    func JsonToXlm(jsonObject: JsonObject) -> XmlObject{
        return XmlObject()
    }
    
    func getData(queryData: JsonObject) -> JsonObject {
        let xml = JsonToXlm(jsonObject: queryData)
        let responseXml = _srvice.getParams(queryData: xml)
        return XmlToJson(xmlObject: responseXml)
    }
}

class Client{
    func doWork(service: IJsonService){
        let q = JsonObject()
        _ = service.getData(queryData: q)
    }
}
