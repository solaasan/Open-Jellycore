//
//  OpenInParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct OpenInParameter: ParameterProtocol, Codable {
	var WFInput: JellyVariableReference?
	var WFOpenInAppIdentifier: JellyString?
	var WFOpenInAskWhenRun: JellyBoolean?


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        var parameters = OpenInParameter()

        if let variableCall = call.first(where: { node in return node.slotName == "input" })?.item {
            if let variable = scopedVariables.first(where: { variable in
                return variable.name == variableCall.content
            }) {
                parameters.WFInput = JellyVariableReference(variable, scopedVariables: scopedVariables)
            } else {
                ErrorReporter.shared.reportError(error: .variableDoesNotExist(variable: variableCall.content), node: nil)
            }
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openIn", name: "input"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "app" }) {
            parameters.WFOpenInAppIdentifier = JellyString(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openIn", name: "app"), node: nil)
        }
        if let value = call.first(where: { node in return node.slotName == "ask" }) {
            parameters.WFOpenInAskWhenRun = JellyBoolean(parameterItem: value, scopedVariables: scopedVariables)
        } else {
            ErrorReporter.shared.reportError(error: .missingParameter(function: "openIn", name: "ask"), node: nil)
        }

        return parameters
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
			"input": "Clipboard",
			"app": "com.apple.mobilenotes",
			"ask": "false",

        ]
    }
}