//
//  Sampler.swift
//
//  Created by Ignacio Bonafonte on 15/10/2019.
//

import Foundation
import OpenTelemetryApi

public protocol Sampler: AnyObject, CustomStringConvertible {
    /// <summary>
    /// Checks whether span needs to be created and tracked.
    /// </summary>
    /// <param name="parentContext">Parent span context. Typically taken from the wire.</param>
    /// <param name="traceId">Trace ID of a span to be created.</param>
    /// <param name="spanId">Span ID of a span to be created.</param>
    /// <param name="name"> Name of a span to be created. Note, that the name of the span is settable.
    /// So this name can be changed later and <see cref="ISampler"/> implementation should assume that.
    /// Typical example of a name change is when <see cref="ISpan"/> representing incoming http request
    /// has a name of url path and then being updated with route name when routing complete.
    /// </param>
    /// <param name="links">Links associated with the span.</param>
    /// <returns>Sampling decision on whether Span needs to be sampled or not.</returns>
    func shouldSample(parentContext: SpanContext?, traceId: TraceId, spanId: SpanId, name: String, parentLinks: [Link]) -> Decision
}

public protocol Decision {
    /// <summary>
    /// Gets a value indicating whether Span was sampled or not.
    /// The value is not suppose to change over time and can be cached.
    /// </summary>
    var isSampled: Bool { get }

    /// <summary>
    /// Gets a map of attributes associated with the sampling decision.
    /// </summary>
    var attributes: [String: AttributeValue] { get }
}
