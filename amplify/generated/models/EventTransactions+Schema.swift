// swiftlint:disable all
import Amplify
import Foundation

extension EventTransactions {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case customerid
    case eventid
    case numberoftickets
    case subtotal
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let eventTransactions = EventTransactions.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "EventTransactions"
    model.syncPluralName = "EventTransactions"
    
    model.attributes(
      .primaryKey(fields: [eventTransactions.id])
    )
    
    model.fields(
      .field(eventTransactions.id, is: .required, ofType: .string),
      .field(eventTransactions.customerid, is: .optional, ofType: .string),
      .field(eventTransactions.eventid, is: .optional, ofType: .string),
      .field(eventTransactions.numberoftickets, is: .optional, ofType: .int),
      .field(eventTransactions.subtotal, is: .optional, ofType: .double),
      .field(eventTransactions.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(eventTransactions.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension EventTransactions: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}