// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Castle"
{
	Properties
	{
		_FallOff("FallOff", Float) = 1
		_LightColor("LightColor", Color) = (0,0,0,0)
		_DarkColor("DarkColor", Color) = (0,0,0,0)
		_Range("Range", Float) = 10
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float3 worldPos;
		};

		uniform float4 _LightColor;
		uniform float4 _DarkColor;
		uniform float _Range;
		uniform float _FallOff;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_worldPos = i.worldPos;
			float lerpResult26 = lerp( 0.0 , _Range , (0.0 + (sin( _Time.y ) - -1.0) * (0.5 - 0.0) / (1.0 - -1.0)));
			float4 lerpResult30 = lerp( _LightColor , _DarkColor , saturate( pow( ( distance( ase_worldPos , float3(-4.17,-0.5,-3.47) ) / lerpResult26 ) , _FallOff ) ));
			o.Albedo = lerpResult30.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17200
0;367.2;1171;456.2;2202.273;281.9261;2.402614;True;False
Node;AmplifyShaderEditor.RangedFloatNode;22;-2429.531,338.2495;Inherit;False;Constant;_Scale;Scale;4;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;21;-2208.594,353.6887;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;23;-1980.26,339.3848;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;2;-1712.096,4.117681;Inherit;False;Constant;_Point;Point;0;0;Create;True;0;0;False;0;-4.17,-0.5,-3.47;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;20;-1550.407,225.5213;Inherit;False;Property;_Range;Range;3;0;Create;True;0;0;False;0;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;24;-1707.817,350.2001;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;29;-1667.606,-183.869;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;26;-1292.714,345.0147;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;27;-1311.832,93.13762;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-966.9605,267.6716;Inherit;False;Property;_FallOff;FallOff;0;0;Create;True;0;0;False;0;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;25;-950.8742,131.3324;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;28;-767.8101,166.2524;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;31;-539.7903,173.8647;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;8;-607.342,-79.54189;Inherit;False;Property;_DarkColor;DarkColor;2;0;Create;True;0;0;False;0;0,0,0,0;0.2737325,0.03279637,0.6320754,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;9;-611.5202,-250.2205;Inherit;False;Property;_LightColor;LightColor;1;0;Create;True;0;0;False;0;0,0,0,0;0.6698113,0.6698113,0.6698113,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;30;-254.0091,77.58749;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;60.23477,-5.019565;Float;False;True;2;ASEMaterialInspector;0;0;Standard;Castle;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;21;0;22;0
WireConnection;23;0;21;0
WireConnection;24;0;23;0
WireConnection;26;1;20;0
WireConnection;26;2;24;0
WireConnection;27;0;29;0
WireConnection;27;1;2;0
WireConnection;25;0;27;0
WireConnection;25;1;26;0
WireConnection;28;0;25;0
WireConnection;28;1;6;0
WireConnection;31;0;28;0
WireConnection;30;0;9;0
WireConnection;30;1;8;0
WireConnection;30;2;31;0
WireConnection;0;0;30;0
ASEEND*/
//CHKSM=D293783483F45D2FDCDC33FDB3733EC6B46F8EA9