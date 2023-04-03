//
//  IpView.swift
//  Assignment3
//
//  Created by Brian Rawlins on 3/26/23.
//

import SwiftUI

struct IpView: View {
    
    @ObservedObject var ipvm = IpViewModel()
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    IpDetail(ipinfo: ipvm.IpData!)
                } label: {
                    Text(ipvm.IpData!.ip)
                }
                
            }
                
        }
            .listStyle(.grouped)
            .navigationTitle("IP")
            .alert(isPresented: $ipvm.hasError, error: ipvm.error) {
                Text("")
            }
            .onAppear() {
                ipvm.fetchData()
            }
        }
        
    }
//}


struct IpView_Previews: PreviewProvider {
    static var previews: some View {
        IpView()
    }
}
