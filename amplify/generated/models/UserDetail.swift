// swiftlint:disable all
import Amplify
import Foundation

public struct UserDetail: Model {
  public let id: String
  public var username: String?
  public var password: String?
  public var usertype: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      username: String? = nil,
      password: String? = nil,
      usertype: String? = nil) {
    self.init(id: id,
      username: username,
      password: password,
      usertype: usertype,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      username: String? = nil,
      password: String? = nil,
      usertype: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.username = username
      self.password = password
      self.usertype = usertype
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}