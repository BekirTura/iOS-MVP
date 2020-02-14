# iOS-MVP (Inprogres)
iOS Mvp (Alamofire 5.0) Swift
@Mvp @iOS Development Architecture
@Mobile Architecture

# Requirements

* Swift 5
* Xcode 11+
* Alamofire 5.0.0 rc3 (https://github.com/Alamofire/Alamofire)

# Base Mvp Layer 

* BaseScreen

```Swift 
import UIKit

class BaseScreen<P>: UIViewController{
    
    var presenter: P?
    
    let baseData = BaseData.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        initPresenter()
        initData()
        initUI()
    }
    
    func initData(){
        fatalError("Subclasses must implement initData()")

    }
    
    func initUI() {
        fatalError("Subclasses must implement initUI()")
    }
    
    func initPresenter() {
        fatalError("Subclasses must implement initPresenter()")
    }
    
    func getBaseData()-> BaseData {
        return baseData
    }
}
```

* BasePresenter
```Swift  
public class BasePresenter<V>{
    var baseView : V?
    
    let restClient = RestClient.sharedInstance
    
    init(baseView: V) {
        self.baseView = baseView
    }
   
    func detachView() {
           baseView = nil
    }
    
}
```
* BaseView
```Swift  
public protocol BaseView{
    func setUIData();
}
```

# Mvp Layer Example Using (Using Base Mvp Layer)

* EventView
```Swift  
public protocol EventView: BaseView{
    func onSuccessVideo(data:[Event]);
}
```

* EventPresenter

```Swift  

public class EventPresenter: BasePresenter<EventView> {
  
    func denemeRequest()  {
        self.restClient.getEventList(successHandler: {(response) in
            if(response.data != nil){
                self.baseView?.onSuccessVideo(data: response.data!)
            }
        }, failHandler: {_ in
            
        })
    }
}
```

* EventScreen

```Swift 
import UIKit

class EventScreen:BaseScreen<EventPresenter>,EventView{
  
    let baseData2:BaseData = BaseData.shared
    override func initPresenter() {
        presenter =  EventPresenter(baseView: self)
    }
    
    func onSuccessVideo(data:[Event]) {
          
    }
      
    func setUIData() {
          
    }
      
}
```
    
# Network Layer

* BaseApiRequest
```Swift  
import Alamofire
public protocol BaseApiRequest {
    var requestMethod: RequestHttpMethod?{ get }
    var requestBodyObject: BaseObject?{ get }
    var requestPath: String {get}
    func request() -> URLRequest
}

```
* BaseApiRequest
    * Extension
    * NOT: swift protocol default parameter value (Protocol BaseApiRequest => extension BaseApiRequest)
```Swift  
extension BaseApiRequest{
    var enviroment: Environment {
        return Environment.Dev
    }
    public func request() -> URLRequest {
        let url: URL! = URL(string: baseUrl+requestPath)
        var request = URLRequest(url: url)
        switch requestMethod {
        case .Get:
            request.httpMethod = "GET"
            break
        case .Post:
            request.httpMethod = "POST"
            if(requestBodyObject != nil){
                let jsonEncoder = JSONEncoder()
                do {
                    request.httpBody = try jsonEncoder.encode(requestBodyObject)
                } catch  {
                    print(error)
                }
            }
            break
        default:
            request.httpMethod = "GET"
            break
        }
        return request
    }
    
    
    var baseUrl: String {
        switch enviroment {
        case .Prod:
            return "https://api.myjson.com/bins"
        case .Dev:
            return "https://api.myjson.com/bins"
        default:
            return "https://api.myjson.com/"
        }
    }
}

public enum RequestHttpMethod{
    case Get
    case Post
}

public enum Environment{
    case Prod
    case Dev
    case UAT
}
```
* BaseApiRequest
     * Enums
```Swift  
public enum RequestHttpMethod{
    case Get
    case Post
}

public enum Environment{
    case Prod
    case Dev
    case UAT
}
```

* PostEventApiRequest
```Swift  
public class PostEventApiRequest: BaseApiRequest {
    public var requestBodyObject: BaseObject?
    public var requestMethod: RequestHttpMethod? = RequestHttpMethod.Post
    public var requestPath: String = "/sltf6"

    func setBodyObject(bodyObject: Event) {
        self.requestBodyObject = bodyObject
    }
}
```

* GetEventListApiRequest
```Swift   
public class GetEventListApiRequest: BaseApiRequest {    
    public var requestMethod: RequestHttpMethod?
    public var requestPath: String = "/sltf6"
}
```
* Model

* BaseObject

path = model/
```Swift   
public class BaseObject:Codable{}
```
* GetEventResponse

path = model/response
```Swift   
public class GetEventResponse:BaseObject{
    
    
    var data : [Event]?
    
    enum CodingKeys: String, CodingKey {
          case data = "Data"
    }
 }
``` 

* Event

 path = model/data

```Swift
public class Event: BaseObject {
    var categoryName:String!
    var cityName:String!
     enum CodingKeys: String, CodingKey {
        case categoryName = "CategoryName"
        case cityName = "CityName"
    }
}

``` 


 Alamofire Generic Request 
* RestClient

```Swift   
private func sendRequest<T:Codable>(_ request:BaseApiRequest,_ type :T.Type,successHandler:@escaping(T)->(),failHandler:@escaping(Error)->()){
        AF.request(request.request()).responseDecodable { (response:AFDataResponse<T>) in
             switch response.result{
                       case .success(let responseEventList):
                           successHandler(responseEventList)
                           print("success")
                       case .failure(let error):
                           failHandler(error)
                           print("fail")
            }
        }
    }
 ```
 
* IServiceHandler
    * Protocol

```Swift   
public protocol IServiceHandler {
    func getEventList(successHandler:@escaping(GetEventResponse)->(),
                      failHandler:@escaping(Error)->())
     
    func postEvent(event:Event,successHandler: @escaping (GetEventResponse) -> (), failHandler: @escaping (Error) -> ())
}
 ```

