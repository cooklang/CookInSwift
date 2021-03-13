//
//  SymbolTableTests.swift
//  SwiftCookInterpreterTests
//
//  Created by Alexey Dubovskoy on 10/12/2020.
//  Copyright © 2020 Alexey Dubovskoy. All rights reserved.
//

import Foundation
@testable import CookInterpreter
import XCTest

class SemanticAnalyzerTests: XCTestCase {
    func testSemanticAnalyzer() {
        let program =
            """
            Add @chilli{3}, @ginger{10%g} and @milk{1%litre} place in #oven and cook for ~{10%minutes}
            """

        let parser = Parser(program)
        let node = parser.parse()

        let analyzer = SemanticAnalyzer()
        let recipe = analyzer.analyze(node: node)
            
        
        XCTAssertEqual(recipe.steps.map{ $0.directions }, ["Add chilli, ginger and milk place in oven and cook for 10 minutes"])
    }
    
//    test valid ingridient: when only units, but no name of in

    
}
