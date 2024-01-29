//
//  TodoApp.swift
//  Todo
//
//  Created by Aashay Pawar on 28/01/24.
//

import SwiftUI
import Amplify
import AWSDataStorePlugin
import AWSPluginsCore
import Combine
import AWSAPIPlugin


@main
struct TodoApp: App {
    init(){
        configureAmplify()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    // Confiruging and Initializing Amplify
    func configureAmplify() {
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
        let apiPlugin = AWSAPIPlugin()
        
        do {
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.add(plugin: apiPlugin)
            try Amplify.configure()
            print("Initialized Amplify");
        } catch {
            print("Could not initialize Amplify: \(error)")
        }
    }
    
    
    // Create User
    func createUserDetail(_username: String, _password: String, _usertype: String) async {
        let model = UserDetail(
            username: _username,
            password: _password,
            usertype: _usertype)
        do {
            let result = try await Amplify.API.mutate(request: .create(model))
            switch result {
            case .success(let model):
                print("Successfully created UserDetail: \(model)")
            case .failure(let graphQLError):
                print("Failed to create graphql \(graphQLError)")
            }
        } catch let error as APIError {
            print("Failed to create UserDetail - \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
    // Get User Particular Details:
    func userAuth(_ username: String, _ password: String) async -> Bool {
        do {
            let predicate = UserDetail.keys.username == username
            let result = try await Amplify.API.query(
                request: .list(UserDetail.self, where: predicate)
            )

            switch result {
            case .success(let models):
                guard let user = models.first else {
                    print("User not found for username: \(username)")
                    return false
                }
                if(user.password == password){
                    print("Successfully retrieved user: \(String(describing: user.password))")
                    return true
                }
            case .failure(let error):
                print("Got failed result with \(error)")
            }
        } catch let error as APIError {
            print("Failed to query UserDetail - \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
        
        return false
    }
    
    // Get userType:
    func getUserType(byUsername username: String) async -> String {
        do {
            let predicate = UserDetail.keys.username == username
            let result = try await Amplify.API.query(
                request: .list(UserDetail.self, where: predicate)
            )
            
            switch result {
            case .success(let userDetailList):
                guard let userDetail = userDetailList.first else {
                    print("Could not find user with username: \(username)")
                    return ""
                }

                // Assuming `usertype` is a property in your UserDetail model
                if let userType = userDetail.usertype {
                    print("User Type for \(username): \(userType)")
                    return userType
                } else {
                    print("User Type not available for \(username)")
                }

            case .failure(let error):
                print("Got failed result with \(error)")
            }
        } catch let error as APIError {
            print("Failed to query UserDetail - \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
        
        return ""
    }

    // Example usage:
    // await getUserDetail(byUsername: "desiredUsername")
    func getEvents() async -> [EventModel] {
        var r: [EventModel] = []  // Initialize an empty array of EventModel

        do {
            let result = try await Amplify.API.query(
                request: .list(Events.self)
            )
            switch result {
            case .success(let listResponse):
                let events = listResponse.elements  // No need for guard since it's not optional

                if !events.isEmpty {
                    for event in events {
                        if let eventName = event.eventname,
                           let eventCity = event.eventcity,
                           let ticketPrice = event.ticketprice {

                            var e = EventModel()
                            e.eventname = eventName
                            e.eventcity = eventCity
                            e.ticketprice = ticketPrice

                            r.append(e)
                            print("Event Name: \(eventName), Event City: \(eventCity), Ticket Price: \(ticketPrice)")
                        } else {
                            print("Event is missing some information")
                        }
                    }
                } else {
                    print("No events found")
                }
            case .failure(let error):
                print("Got failed result with \(error)")
            }
        } catch let error as APIError {
            print("Failed to query Events - \(error)")
        } catch {
            print("Unexpected error: \(error)")
        }
        
        return r
    }











}
