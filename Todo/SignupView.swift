import SwiftUI

struct SignupView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var selectedRole = "Host" // Default role
    @State private var showAlertUserExists = false
    @State private var navigateToLogin = false

    var roles = ["Host", "Customer"]

    var body: some View {
        VStack {
            Text("Signup")

            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Picker("Select Role", selection: $selectedRole) {
                ForEach(roles, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button("Signup") {
                // Perform signup logic here
                Task{
                    if await TodoApp().userAuth(username, password) == false{
                        await TodoApp().createUserDetail(_username: username, _password: password, _usertype: selectedRole)
                        // Take user to Login Page
                        navigateToLogin = true
                    } else {
                        // Create Alert to show user already exists
                        showAlertUserExists = true
                    }
                }
            }
            .padding()
            .alert(isPresented: $showAlertUserExists) {
                Alert(
                    title: Text("User Already Exists"),
                    message: Text("The user already exists."),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            NavigationLink("", destination: ContentView(), isActive: $navigateToLogin)
                            .hidden()
        }
        .padding()
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
