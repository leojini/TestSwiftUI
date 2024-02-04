//
//  TabView2.swift
//  TestSwiftUI
//
//  Created by Leojin on 2024/01/29.
//

import SwiftUI
import Combine

struct TabView2: View {
    @State var idValue = "ID"
    @State var passwordValue = "Password"
    @State var viewModel = TabViewModel2()
    @State var anyCancellable = Set<AnyCancellable>()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            HStack {
                Spacer(minLength: 20)
                TextField("ID", text: $idValue)
                    .padding()
                    .background(.blue)
                    .cornerRadius(10)
                    .onChange(of: idValue) { newValue in
                        print("change id textfield")
                        viewModel.idText.send(newValue)
                    }
                Spacer(minLength: 20)
            }
            HStack {
                Spacer(minLength: 20)
                TextField("Password", text: $passwordValue)
                    .padding()
                    .background(.yellow)
                    .cornerRadius(10)
                    .onChange(of: passwordValue) { newValue in
                        print("change password textfield")
                        viewModel.passwordText.send(newValue)
                        
                    }
                Spacer(minLength: 20)
            }
            HStack {
                Spacer(minLength: 20)
                Button {
                    print("click")
                } label: {
                    Text("확인")
                        .frame(width: UIScreen.screenWidth - 40, height: 50)
                        .background(.green)
                        .cornerRadius(10)
                }
                Spacer(minLength: 20)
            }
        })
        .onAppear {
            bind()
        }
    }
    
    private func bind() {
        // combine viewModel property
        viewModel.idText.sink { [self] value in
            print("idText : \(self.viewModel.idText.value)")
        }
        .store(in: &anyCancellable)
        
        viewModel.passwordText.sink { [self] value in
            print("passwordText : \(self.viewModel.passwordText.value)")
        }
        .store(in: &anyCancellable)
    }
}

struct TabView2_Previews: PreviewProvider {
    static var previews: some View {
        TabView2()
    }
}
