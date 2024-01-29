// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "6089b6691efca5fb857344b369205438"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: EventTransactions.self)
    ModelRegistry.register(modelType: Events.self)
    ModelRegistry.register(modelType: UserDetail.self)
  }
}