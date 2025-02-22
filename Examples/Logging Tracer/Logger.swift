/*
 * Copyright 2019, Undefined Labs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

class Logger {
    static let startTime = Date()

    static func printHeader() {
        print("TimeSinceStart | ThreadId | API")
    }

    static func log(_ s: String) {
        let output = String(format: "%.9f | %@ | %@", timeSinceStart(), Thread.current.description, s)
        print(output)
    }

    private static func timeSinceStart() -> Double {
        let start = startTime
        return Date().timeIntervalSince(start)
    }
}
