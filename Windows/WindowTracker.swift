//
//  WindowTracker.swift
//  Windows
//
//  Created by Thomas Leese on 16/05/2024.
//

import HomeKit

class WindowTracker {
  private let defaults = UserDefaults.standard

  func isOpen(forRoom room: HMRoom) -> Bool {
    state(forRoom: room) == .open
  }

  func isClosed(forRoom room: HMRoom) -> Bool {
    state(forRoom: room) == .closed
  }

  private enum State {
    case open
    case closed
    case unknown
  }

  private func state(forRoom room: HMRoom) -> State {
    let key = "room-\(room.uniqueIdentifier.uuidString)"
    if let value = defaults.object(forKey: key) as? Bool {
      return value ? .open : .closed
    } else {
      return .unknown
    }
  }
}
