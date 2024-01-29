import SwiftUI

struct HostMainScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
                
                NavigationLink(destination: EventDetailsView()) {
                    Text("Create Event")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Host Main Screen")
        }
    }
}

struct EventDetailsView: View {
    @State private var eventName = ""
    @State private var eventCity = ""
    @State private var numberOfTickets = 0
    @State private var ticketPrice = 0.0
    @State private var eventDate = Date()
    @State private var startTime = Date()
    @State private var endTime = Date()

    var body: some View {
        Form {
            Section(header: Text("Event Information")) {
                TextField("Event Name", text: $eventName)
                TextField("Event City", text: $eventCity)
                Stepper(value: $numberOfTickets, in: 0...100, label: {
                    Text("Number of Tickets: \(numberOfTickets)")
                })
                TextField("Ticket Price", value: $ticketPrice, formatter: NumberFormatter())
            }

            Section(header: Text("Event Schedule")) {
                DatePicker("Event Date", selection: $eventDate, displayedComponents: .date)
                DatePicker("Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                DatePicker("End Time", selection: $endTime, displayedComponents: .hourAndMinute)
            }

            Section {
                Button(action: {
                    // Perform action when the form is submitted
                }) {
                    Text("Submit Event")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 44)
                .background(Color.blue)
                .cornerRadius(8)
            }
        }
        .navigationTitle("Event Details")
    }
}

struct HostMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        HostMainScreen()
    }
}
