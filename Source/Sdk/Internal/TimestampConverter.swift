//
//  TimestampConverter.swift
//  OpenTelemetrySwift
//
//  Created by Ignacio Bonafonte on 05/11/2019.
//

import Foundation

struct TimestampConverter: Equatable {
    static let nanosPerSecond = 1000000000
    static let nanosPerMilli = 1000000

    private var timestamp: Timestamp
    private var nanoTime: Int

    private init(timestamp: Timestamp, nanoTime: Int) {
        self.timestamp = timestamp
        self.nanoTime = nanoTime
    }

    /**
     * Returns a {@code TimestampConverter} initialized to now.
     *
     * @param clock the {@code Clock} to be used to read the current time.
     * @return a {@code TimestampConverter} initialized to now.
     */
    static func now(clock: Clock) -> TimestampConverter {
        return TimestampConverter(timestamp: clock.now, nanoTime: clock.nowNanos)
    }

    /**
     * Converts a {@link System#nanoTime() nanoTime} value to {@link Timestamp}.
     *
     * @param nanoTime value to convert.
     * @return the {@code Timestamp} representation of the {@code time}.
     */
    public func convertNanoTime(nanoTime: Int) -> Timestamp {
        return Timestamp(timeInterval: Double(nanoTime) / Double(TimestampConverter.nanosPerSecond))
    }
}
