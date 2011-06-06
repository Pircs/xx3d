#include "shared.fx"

struct VS_INPUT
{
    float4  Pos     : POSITION;
    float2  UV0     : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4  Pos     : POSITION;
	float3  UV0		: TEXCOORD0;
};
float3 LuminanceConv = { 0.2125f, 0.7154f, 0.0721f };
float4 PS(VS_OUTPUT i) : COLOR0
{
	float3 color = tex2D(g_samScene, i.UV0).xyz;
	float fIndex = max(dot( color, LuminanceConv ),0.08f);
	float3 color1 = tex2D(g_samDiffuse, float2(fIndex,0.0f)).xyz;
	
	return float4(color*color1/fIndex,1.0f);
}

technique Render
{
    pass P0
    {
	AddressU[0] = BORDER ;
AddressV[0] = BORDER ;
AddressW[0] = BORDER ;

        VertexShader = NULL;
        PixelShader  = compile ps_2_0 PS();
    }
}