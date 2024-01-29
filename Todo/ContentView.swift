import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlertUserDoesNotExist = false
    @State private var isSignupActive = false
    @State private var isHost = false
    @State private var isCustomer = false

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textCase(.lowercase)
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Test"){
                    Task{
                        await TodoApp().getEvents()
                    }
                }

                Button("Login") {
                    Task {
                        if await TodoApp().userAuth(email, password) {
                            if await TodoApp().getUserType(byUsername:email) == "Host"{
                                isHost = true
                            }
                            if await TodoApp().getUserType(byUsername:email) == "Customer"{
                                isCustomer = true
                            }
                        } else {
                            showAlertUserDoesNotExist = true
                        }
                    }
                }
                .padding()
                .alert(isPresented: $showAlertUserDoesNotExist) {
                    Alert(
                        title: Text("User Does Not Exist"),
                        message: Text("The user does not exist."),
                        dismissButton: .default(Text("OK"))
                    )
                }

                NavigationLink("Signup", destination: SignupView())
                    .padding()
                
                NavigationLink("", destination: HostMainScreen(), isActive: $isHost).hidden()
                NavigationLink("", destination: CustomerMainScreen(), isActive: $isCustomer).hidden()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
}
