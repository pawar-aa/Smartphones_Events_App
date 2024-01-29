// swiftlint:disable all
import Amplify
import Foundation

public struct EventTransactions: Model {
  public let id: String
  public var customerid: String?
  public var eventid: String?
  public var numberoftickets: Int?
  public var subtotal: Double?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      customerid: String? = nil,
      eventid: String? = nil,
      numberoftickets: Int? = nil,
      subtotal: Double? = nil) {
    self.init(id: id,
      customerid: customerid,
      eventid: eventid,
      numberoftickets: numberoftickets,
      subtotal: subtotal,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      customerid: String? = nil,
      eventid: String? = nil,
      numberoftickets: Int? = nil,
      subtotal: Double? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.customerid = customerid
      self.eventid = eventid
      self.numberoftickets = numberoftickets
      self.subtotal = subtotal
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}