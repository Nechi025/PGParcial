// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Coin"
{
	Properties
	{
		_Color0("Color 0", Color) = (0.8196079,0.627451,0.3098039,1)
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard alpha:fade keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float3 worldPos;
		};

		uniform float4 _Color0;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 temp_output_14_0 = _Color0;
			o.Albedo = temp_output_14_0.rgb;
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float mulTime18 = _Time.y * 3.0;
			float3 temp_cast_1 = (( sin( ( ase_vertex3Pos.x + ase_vertex3Pos.y + ( 100 + mulTime18 ) ) ) - 0.8 )).xxx;
			o.Emission = ( _Color0 * saturate( ( 1.0 - ( ( distance( float3( 0.2,0.2,0.2 ) , temp_cast_1 ) - 0.04 ) / max( 0.1 , 1E-05 ) ) ) ) ).rgb;
			o.Metallic = 0.5;
			o.Smoothness = 0.85;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17200
0;450.4;1171;373;1638.063;-46.35707;1.373342;True;False
Node;AmplifyShaderEditor.Vector3Node;17;-1655.596,149.5032;Inherit;False;Constant;_Vector0;Vector 0;1;0;Create;True;0;0;False;0;0,100,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleTimeNode;18;-1658.748,332.4905;Inherit;False;1;0;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;19;-1437.935,304.6414;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;3;-1439.117,129.1227;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;22;-1201.408,218.4787;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;21;-1036.042,208.5024;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;23;-752.59,191.5787;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0.8;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;14;-1010.981,-64.18666;Inherit;False;Property;_Color0;Color 0;0;0;Create;True;0;0;False;0;0.8196079,0.627451,0.3098039,1;0.9137256,0.6352941,0.2392157,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;25;-467.5192,156.9713;Inherit;False;Color Mask;-1;;1;eec747d987850564c95bde0e5a6d1867;0;4;1;FLOAT3;0,0,0;False;3;FLOAT3;0.2,0.2,0.2;False;4;FLOAT;0.04;False;5;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1;-247.8959,224.9492;Inherit;False;Constant;_Metallic;Metallic;0;0;Create;True;0;0;False;0;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-265.8959,308.9495;Inherit;False;Constant;_Smoothness;Smoothness;0;0;Create;True;0;0;False;0;0.85;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-258.4023,54.66829;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;ASEMaterialInspector;0;0;Standard;Coin;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;True;0;False;Transparent;;Transparent;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;19;0;17;2
WireConnection;19;1;18;0
WireConnection;22;0;3;1
WireConnection;22;1;3;2
WireConnection;22;2;19;0
WireConnection;21;0;22;0
WireConnection;23;0;21;0
WireConnection;25;1;23;0
WireConnection;16;0;14;0
WireConnection;16;1;25;0
WireConnection;0;0;14;0
WireConnection;0;2;16;0
WireConnection;0;3;1;0
WireConnection;0;4;2;0
ASEEND*/
//CHKSM=71B32AAC4F06B21D22D08405D50BC21FCAB78201