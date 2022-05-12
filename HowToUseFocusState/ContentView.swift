//
//  ContentView.swift
//  HowToUseFocusState
//
//  Created by Ramill Ibragimov on 12.05.2022.
//

import SwiftUI

enum FocusText {
    case username, password
}

struct ContentView: View {
    @FocusState private var focusField: FocusText?
    @State private var usernameText = ""
    @State private var passwordText = ""
    @State private var submittedText = "Submit credentials"
    
    var body: some View {
        Form {
            Section("Credentials") {
                TextField("Enter a username", text: $usernameText)
                    .focused($focusField, equals: .username)
                    .submitLabel(.next)
                    .onSubmit {
                        focusField = .password
                    }
                
                TextField("Enter a password", text: $passwordText)
                    .focused($focusField, equals: .password)
                    .submitLabel(.next)
                    .onSubmit {
                        submitData()
                    }
            }
            Section("Submitted") {
                Text(submittedText)
            }
        }
        
    }
    
    private func submitData() {
        focusField = nil
        submittedText = "\(usernameText), \(passwordText)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
