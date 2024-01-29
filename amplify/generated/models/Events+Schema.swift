// swiftlint:disable all
import Amplify
import Foundation

extension Events {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case eventname
    case eventdescription
    case eventdate
    case eventtimestart
    case eventtimeend
    case eventcity
    case totalnumberofseats
    case ticketprice
    case hostid
    case leftnumberofseats
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let events = Events.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "Events"
    model.syncPluralName = "Events"
    
    model.attributes(
      .primaryKey(fields: [events.id])
    )
    
    model.fields(
      .field(events.id, is: .required, ofType: .string),
      .field(events.eventname, is: .optional, ofType: .string),
      .field(events.eventdescription, is: .optional, ofType: .string),
      .field(events.eventdate, is: .optional, ofType: .date),
      .field(events.eventtimestart, is: .optional, ofType: .time),
      .field(events.eventtimeend, is: .optional, ofType: .time),
      .field(events.eventcity, is: .optional, ofType: .string),
      .field(events.totalnumberofseats, is: .optional, ofType: .int),
      .field(events.ticketprice, is: .optional, ofType: .double),
      .field(events.hostid, is: .optional, ofType: .string),
      .field(events.leftnumberofseats, is: .optional, ofType: .int),
      .field(events.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(events.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Events: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}