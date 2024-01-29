// swiftlint:disable all
import Amplify
import Foundation

public struct Events: Model {
  public let id: String
  public var eventname: String?
  public var eventdescription: String?
  public var eventdate: Temporal.Date?
  public var eventtimestart: Temporal.Time?
  public var eventtimeend: Temporal.Time?
  public var eventcity: String?
  public var totalnumberofseats: Int?
  public var ticketprice: Double?
  public var hostid: String?
  public var leftnumberofseats: Int?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      eventname: String? = nil,
      eventdescription: String? = nil,
      eventdate: Temporal.Date? = nil,
      eventtimestart: Temporal.Time? = nil,
      eventtimeend: Temporal.Time? = nil,
      eventcity: String? = nil,
      totalnumberofseats: Int? = nil,
      ticketprice: Double? = nil,
      hostid: String? = nil,
      leftnumberofseats: Int? = nil) {
    self.init(id: id,
      eventname: eventname,
      eventdescription: eventdescription,
      eventdate: eventdate,
      eventtimestart: eventtimestart,
      eventtimeend: eventtimeend,
      eventcity: eventcity,
      totalnumberofseats: totalnumberofseats,
      ticketprice: ticketprice,
      hostid: hostid,
      leftnumberofseats: leftnumberofseats,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      eventname: String? = nil,
      eventdescription: String? = nil,
      eventdate: Temporal.Date? = nil,
      eventtimestart: Temporal.Time? = nil,
      eventtimeend: Temporal.Time? = nil,
      eventcity: String? = nil,
      totalnumberofseats: Int? = nil,
      ticketprice: Double? = nil,
      hostid: String? = nil,
      leftnumberofseats: Int? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.eventname = eventname
      self.eventdescription = eventdescription
      self.eventdate = eventdate
      self.eventtimestart = eventtimestart
      self.eventtimeend = eventtimeend
      self.eventcity = eventcity
      self.totalnumberofseats = totalnumberofseats
      self.ticketprice = ticketprice
      self.hostid = hostid
      self.leftnumberofseats = leftnumberofseats
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}