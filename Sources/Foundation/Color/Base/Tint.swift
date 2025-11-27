enum Tint: CaseIterable, Sendable {
    case value0
    case value1
    case value2
    case value3
    case value4
    case value5
    case value6
    case value7
    case value8
    case value9
    
    var inverse: Tint {
        switch self {
            case .value0:
                .value9
            case .value1:
                .value8
            case .value2:
                .value7
            case .value3:
                .value6
            case .value4:
                .value5
            case .value5:
                .value4
            case .value6:
                .value3
            case .value7:
                .value2
            case .value8:
                .value1
            case .value9:
                .value0
        }
    }
    
    var lighter: Tint {
        switch self {
            case .value0:
                .value1
            case .value1:
                .value2
            case .value2:
                .value3
            case .value3:
                .value4
            case .value4:
                .value5
            case .value5:
                .value6
            case .value6:
                .value7
            case .value7:
                .value8
            case .value8:
                .value9
            case .value9:
                .value9
        }
    }
    
    var darker: Tint {
        switch self {
            case .value0:
                .value0
            case .value1:
                .value0
            case .value2:
                .value1
            case .value3:
                .value2
            case .value4:
                .value3
            case .value5:
                .value4
            case .value6:
                .value5
            case .value7:
                .value6
            case .value8:
                .value7
            case .value9:
                .value8
        }
    }
}

extension Tint: CustomStringConvertible {
    public var description: String {
        switch self {
            case .value0:
                "100"
            case .value1:
                "200"
            case .value2:
                "300"
            case .value3:
                "400"
            case .value4:
                "500"
            case .value5:
                "600"
            case .value6:
                "700"
            case .value7:
                "800"
            case .value8:
                "900"
            case .value9:
                "1000"
        }
    }
}
