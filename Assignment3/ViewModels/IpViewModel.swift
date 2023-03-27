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
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(IpResults?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = IpModelError.decodeError
                    return
                }
                self.IpData = results.data
            } catch {
                self.hasError.toggle()
                self.error = IpModelError.customError(error: error)
            }
        }
    }
    
    //func getData -> IpModel() {
    //    return self.IpData
    //}
    
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
