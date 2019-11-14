//
//  DistributedContextManagerSdk.swift
//  OpenTelemetrySwift
//
//  Created by Ignacio Bonafonte on 14/11/2019.
//

import Foundation

class DistributedContextManagerSdk: DistributedContextManager {
    func getCurrentContext() -> DistributedContext {
        return ContextUtils.getCurrentDistributedContext() ?? EmptyDistributedContext.instance
    }

    func getContextBuilder() -> DistributedContextBuilder {
        return DistributedContextSdkBuilder()
    }

    func withContext(distContext: DistributedContext) -> Scope {
        return ContextUtils.withDistributedContext(distContext)
    }

    func getBinaryFormat() -> BinaryFormattable {
        return BinaryTraceContextFormat()
    }

    func getHttpTextFormat() -> TextFormattable {
        return HttpTraceContextFormat()
    }
}
