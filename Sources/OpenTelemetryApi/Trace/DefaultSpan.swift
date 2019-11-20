//
//  DefaultSpan.swift
//
//  Created by Ignacio Bonafonte on 15/10/2019.
//

import Foundation

/**
 * The {@code DefaultSpan} is the default {@link Span} that is used when no {@code Span}
 * implementation is available. All operations are no-op except context propagation.
 *
 * <p>Used also to stop tracing, see {@link Tracer#withSpan}.
 *
 * @since 0.1.0
 */

/// The DefaultSpan is the default Span that is used when no Span
/// implementation is available. All operations are no-op except context propagation.
/// Used also to stop tracing, see Tracer.withSpan()
public class DefaultSpan: Span {
    public var kind: SpanKind

    public var context: SpanContext

    /// Returns a DefaultSpan with an invalid SpanContext.
    public convenience init() {
        self.init(context: SpanContext.invalid, kind: .client)
    }

    /// Creates an instance of this class with the SpanContext.
    /// - Parameter context: the SpanContext
    public convenience init(context: SpanContext) {
        self.init(context: context, kind: .client)
    }

    /// Creates an instance of this class with the SpanContext and Span kind
    /// - Parameters:
    ///   - context: the SpanContext
    ///   - kind: the SpanKind
    public init(context: SpanContext, kind: SpanKind) {
        self.context = context
        self.kind = kind
    }

    public static func random() -> DefaultSpan {
        return DefaultSpan(context: SpanContext.create(traceId: TraceId.random(), spanId: SpanId.random(), traceFlags: TraceFlags(), tracestate: Tracestate()), kind: .client)
    }

    public var isRecordingEvents: Bool {
        return false
    }

    public var status: Status? {
        get {
            return Status.ok
        }
        set {
        }
    }

    public var description: String {
        return "DefaultSpan"
    }

    public func updateName(name: String) {
    }

    public func setAttribute(key: String, value: String) {
    }

    public func setAttribute(key: String, value: Int) {
    }

    public func setAttribute(key: String, value: Double) {
    }

    public func setAttribute(key: String, value: Bool) {
    }

    public func setAttribute(key: String, value: AttributeValue) {
    }

    public func addEvent(name: String) {
    }

    public func addEvent(name: String, timestamp: Int) {
    }

    public func addEvent(name: String, attributes: [String: AttributeValue]) {
    }

    public func addEvent(name: String, attributes: [String: AttributeValue], timestamp: Int) {
    }

    public func addEvent<E>(event: E) where E: Event {
    }

    public func addEvent<E>(event: E, timestamp: Int) where E: Event {
    }

    public func addLink(link: Link) {
    }

    public func end() {
    }

    public func end(endOptions: EndSpanOptions) {
    }
}
