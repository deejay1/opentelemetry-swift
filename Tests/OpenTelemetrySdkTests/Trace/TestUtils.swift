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
import OpenTelemetryApi
@testable import OpenTelemetrySdk

struct TestUtils {
    static func generateRandomAttributes() -> [String: AttributeValue] {
        var result = [String: AttributeValue]()
        let name = UUID().uuidString
        let attribute = AttributeValue.string(UUID().uuidString)
        result[name] = attribute
        return result
    }

    static func makeBasicSpan() -> SpanData {
        return SpanData(traceId: TraceId(), spanId: SpanId(), traceFlags: TraceFlags(), tracestate: Tracestate(), resource: Resource(), instrumentationLibraryInfo: InstrumentationLibraryInfo(), name: "spanName", kind: .server, startEpochNanos: 100000000000 + 100, endEpochNanos: 200000000000 + 200, hasRemoteParent: false)
    }

    static func startSpanWithSampler(tracerSdkFactory: TracerSdkFactory, tracer: Tracer, spanName: String, sampler: Sampler) -> SpanBuilder {
        let originalConfig = tracerSdkFactory.getActiveTraceConfig()
        tracerSdkFactory.updateActiveTraceConfig(originalConfig.settingSampler(sampler))
        defer { tracerSdkFactory.updateActiveTraceConfig(originalConfig) }
        return tracer.spanBuilder(spanName: spanName)
    }
}
