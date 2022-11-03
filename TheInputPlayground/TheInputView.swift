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
    @State private var width = TheInputView.inputWidthDefault
        
    var body: some View {
        
        ZStack(alignment: .leading) {
            Text("X" + theInput.value + "XX")
                .fixedSize()
                .opacity(0)
                .background(GeometryReader { gp in 
                    Color.clear
                        .onAppear { width = gp.frame(in: .local).size.width }
                        .onChange(of: gp.size) { _ in width = gp.frame(in: .local).size.width }
                })
            TextField("", text: $theInput.value)
                .textFieldStyle(.plain)
        }
        .font(.system(size: inputTextSize))
        .onChange(of: width) {
            var rect = theInput.frame
            rect.size.width = $0
            theInput.setFrame(rect, display: false, animate: false)
        }
        .padding(.trailing)
        .padding(6)
    }
        
}
