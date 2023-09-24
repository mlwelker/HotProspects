
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @State private var name = "Anonymous"
    @State private var email = "you@yoursite.com"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                
                Image(uiImage: generateQRCode(from: "\(name)\n\(email)"))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            .navigationTitle("Your Code")
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let output = filter.outputImage {
            if let cgImage = context.createCGImage(output, from: output.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview {
    MeView()
}
