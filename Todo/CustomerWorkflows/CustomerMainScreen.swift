import SwiftUI

struct CustomerMainScreen: View {
    
    @State private var myEvents: [EventModel] = []
    @State private var isRefreshing = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(myEvents, id: \.self) { event in
                    NavigationLink(destination: EventDetailScreen(event: event)) {
                        EventListItem(event: event)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Events")
            .refreshable {
                await refreshEvents()
            }
            .refreshableOverlay(isRefreshing: $isRefreshing) {
                ProgressView()
            }
        }
        .onAppear {
            async {
                await refreshEvents()
            }
        }
    }
    
    func refreshEvents() async {
        do {
            myEvents = try await TodoApp().getEvents()
        } catch {
            print("Error: \(error)")
        }
        isRefreshing = false
    }
}

struct EventListItem: View {
    let event: EventModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.eventname ?? "Unknown Event")
                .font(.headline)
                .fontWeight(.bold)
            
            Text("City: \(event.eventcity ?? "Unknown City")")
                .font(.subheadline)
            
            Text("Ticket Price: \(event.ticketprice.map { "\($0)" } ?? "Unknown Price")")
                .font(.subheadline)
        }
        .padding()
    }
}

struct EventDetailScreen: View {
    let event: EventModel
    
    var body: some View {
        // Your event detail view implementation
        // Customize this view based on your needs
        Text("Event Detail: \(event.eventname ?? "Unknown Event")")
            .navigationTitle("Event Detail")
    }
}

struct CustomerMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        CustomerMainScreen()
    }
}

extension View {
    func refreshableOverlay<Content: View>(isRefreshing: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        overlay(
            Group {
                if isRefreshing.wrappedValue {
                    ZStack {
                        Color.white.opacity(0.001) // Add a transparent overlay
                            .onAppear {
                                Task {
                                    await Task.sleep(500) // A small delay to allow time for the refresh spinner to show
                                    isRefreshing.wrappedValue = false
                                }
                            }
                        content()
                    }
                }
            }
        )
    }
}
