import SwiftUI


struct TheInputView: View {

    static let inputTextSizeDefault: Double = 16
    static let inputWidthDefault: Double = 28
    static let inputBackgroundOpacityDefault: Double = 0.9
    static let inputCornerRadiusDefault: Double = 6
    static let inputBorderThicknessDefault: Double = 2

    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Form {
            InputTextField()
        }
        .cornerRadius(Self.inputCornerRadiusDefault)
        .background(
            RoundedRectangle(cornerRadius: Self.inputCornerRadiusDefault)
                .fill(colorScheme == .light ? .white : .black)
                .opacity(Self.inputBackgroundOpacityDefault)
        )
        .overlay(
            RoundedRectangle(cornerRadius: Self.inputCornerRadiusDefault)
                .stroke(lineWidth: Self.inputBorderThicknessDefault)
        )
        .foregroundColor(colorScheme == .light ? .black : .white)
        .padding()
    }
        
}


private struct InputTextField: View {
    
    
    private var inputTextSize: Double = TheInputView.inputTextSizeDefault
    private var inputWidth: Double = TheInputView.inputWidthDefault
    
    @EnvironmentObject var theInput: TheInput
        
    var body: some View {
        
        TextField("", text: $theInput.value)
            .textFieldStyle(.plain)
            .font(.system(size: inputTextSize))
            .frame(minWidth: inputWidth, alignment: .leading)
            .fixedSize()
            .padding(6)
            .padding(.trailing)
    }
        
}
