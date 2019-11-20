//
//  File.swift
//  
//
//  Created by Ignacio Bonafonte on 20/11/2019.
//

import Foundation

public class NoopSpanBuilder: SpanBuilder {

    private var tracer: Tracer
    private var isRootSpan: Bool = false
    private var spanContext: SpanContext?

    init(tracer: Tracer, spanName: String) {
        self.tracer = tracer
    }

    @discardableResult public func startSpan() -> Span {
        if spanContext == nil && !isRootSpan {
            spanContext = tracer.currentSpan?.context
        }
        return spanContext != nil && spanContext != SpanContext.invalid ? DefaultSpan(context: spanContext!) : DefaultSpan.random()
    }

    @discardableResult public func setParent(_ parent: Span) -> Self {
        spanContext = parent.context
        return self
    }

    @discardableResult public func setParent(_ parent: SpanContext) -> Self {
        spanContext = parent
        return self
    }

    @discardableResult public func setNoParent() -> Self {
        isRootSpan = true
        return self
    }

    @discardableResult public func addLink(spanContext: SpanContext) -> Self {
        return self
    }

    @discardableResult public func addLink(spanContext: SpanContext, attributes: [String: AttributeValue]) -> Self {
        return self
    }

    @discardableResult public func addLink(_ link: Link) -> Self {
        return self
    }

    @discardableResult public func setSpanKind(spanKind: SpanKind) -> Self {
        return self
    }

    @discardableResult public func setStartTimestamp(startTimestamp: Int) -> Self {
        return self
    }
}
