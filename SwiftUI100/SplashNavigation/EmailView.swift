import SwiftUI

class EmailViewModel: ObservableObject {
    @Published var email = "" {
        didSet { saveEmail(email) }
    }

    @Published var isActive = false
    
    func onAppear() {
        guard isFirstAppear else { return }
        isFirstAppear = false
        
        guard let email = getEmail() else { return }
        self.email = email
        
        if isEmailValid {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isActive = true
            }
        }
    }
    
    /// - Private

    private var isFirstAppear = true
    
    private let key = "email"
    
    private func saveEmail(_ email: String) {
        UserDefaults.standard.set(email, forKey: key)
    }
    
    private func getEmail() -> String? {
        UserDefaults.standard.string(forKey: key)
    }
    
    private lazy var isEmailValid: Bool = {
        self.email.count > 8
    }()
}

struct EmailView: View {
    @ObservedObject var emailViewModel = EmailViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("email", text: $emailViewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            NavigationView {
                NavigationLink(destination: CompleteView(), isActive: $emailViewModel.isActive) {
                    Text("Next")
                }
            }
            
            Spacer()
        }.onAppear {
            self.emailViewModel.onAppear()
        }
        .padding()
        .navigationBarTitle("Email")
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
