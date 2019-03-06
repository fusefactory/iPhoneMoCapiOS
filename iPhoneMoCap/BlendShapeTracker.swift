import SceneKit
import ARKit

class BlendShapeTracker: NSObject, ARSCNViewDelegate {
    var faceAnchorTransform: simd_float4x4 = simd_float4x4(0)

    var didGetBlendShapes: (([ARFaceAnchor.BlendShapeLocation: NSNumber]) -> ())?
    
    /// - Tag: ARFaceGeometryUpdate
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor else { return }
        faceAnchorTransform = faceAnchor.transform; //retrive transorm from face
        didGetBlendShapes?(faceAnchor.blendShapes)
    }
}
