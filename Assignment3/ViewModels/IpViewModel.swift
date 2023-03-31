//
//  IpViewModel.swift
//  Assignment3
//
//  Created by Brian Rawlins on 3/26/23.
//

import Foundation

class IpViewModel : ObservableObject {
    
    @Published private(set) var IpData = [IpModel]()
    @Published var hasError = false
    @Published var error : IpModelError?
    private let url = "https://ipinfo.io/json?token=1004daec758201"
    
    // For testing
    private let testJson =
    """
    {
      "ip": "66.68.184.107",
      "hostname": "cpe-66-68-184-107.austin.res.rr.com",
      "city": "Cedar Park",
      "region": "Texas",
      "country": "US",
      "loc": "30.5052,-97.8203",
      "org": "AS11427 Charter Communications Inc",
      "postal": "78613",
      "timezone": "America/Chicago"
    }
    """//.data(using: .utf8)
    
    init() {
        self.fetchData()
        print("Fetching the data")
    }
    

    func fetchData() {
        let jsonData = testJson.data(using: .utf8)!
        let decoder = JSONDecoder()
        guard let results = try? decoder.decode(IpModel.self, from: jsonData) else {
            return
        }
        self.IpData.append(results)

    }
    
//    func fetchData() {
//        if let url = URL(string: self.url) {
//
//            URLSession
//                .shared
//                .dataTask(with: url) { (data, response, error) in
//                    if let error = error {
//                        print(error)
//                    } else {
//                        if let data = data {
//                            do {
//                                let results = try JSONDecoder().decode(IpModel.self, from: data)
//                                DispatchQueue.main.async {
//                                    self.IpData = results
//                                }
//
//                            } catch {
//                                print(error)
//                            }
//                        }
//                    }
//                }.resume()
//        }
//
//    }

    
    
    func findIndex(ips: IpModel) -> Int? {
        for index in 0..<IpData.count {
            if ips.id == IpData[index].id {
                return index
            }
        }
        return nil
    }
    
    func getData() -> [IpModel] {
        return self.IpData
    }
    
}

extension IpViewModel {
    enum IpModelError : LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }
        
    }

}
