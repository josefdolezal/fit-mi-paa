//
//  TestResultBenchmark.swift
//  BackpackBenchmark
//
//  Created by Josef Dolezal on 22/10/2017.
//

import Foundation

public struct TestResultBenchmark {
    public let testsCount: Int
    public let averageAllCasesDuration: Double
    public let averageRatioDuration: Double

    public let averageApproximationError: Double
    public let maxApproximationError: Double
}
