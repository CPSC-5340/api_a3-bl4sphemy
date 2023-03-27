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
    
        func fetchData() {
            if let url = URL(string: self.url) {
    
                URLSession
                    .shared
                    .dataTask(with: url) { (data, response, error) in
                        if let error = error {
                            print(error)
                        } else {
                            if let data = data {
                                do {
                                    let results = try JSONDecoder().decode(IpResults.self, from: data)
                                    DispatchQueue.main.async {
                                        self.IpData = results.data
                                    }
    
                                } catch {
                                    print(error)
                                }
                            }
                        }
                    }.resume()
            }
    
        }
    
    
    
    
    //@MainActor
    //func fetchData() async {
    //    if let url = URL(string: url) {
    //        do {
    //            let (data, _) = try await URLSession.shared.data(from: url)
    //            guard let results = try JSONDecoder().decode(IpResults?.self, from: data) else {
    //                self.hasError.toggle()
    //                self.error = IpModelError.decodeError
    //                return
    //            }
    //            self.IpData = results.data
    //        } catch {
    //            self.hasError.toggle()
    //            self.error = IpModelError.customError(error: error)
    //        }
        //}
    //}
    
    
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
