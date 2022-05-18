shader_type spatial;
uniform sampler2D baseTexture;
uniform sampler2D noiseTexture;
uniform float dissolveAmount : hint_range(0, 1);
uniform float edgeSize = 0.1;
uniform vec4 edgeColor : hint_color;
uniform float edgeThickness = 0.1;
uniform float noiseTiling = 2;
void fragment()
{
	vec4 originalTexture = texture(baseTexture, UV);
	vec4 dissolveNoise = texture(noiseTexture, UV * noiseTiling);
	float remappedDissolve = dissolveAmount * (1.01  + edgeThickness) - edgeThickness;
	vec4 step1 = step(remappedDissolve, dissolveNoise);
	vec4 step2 = step(remappedDissolve + edgeThickness, dissolveNoise);
	vec4 edge = step1 - step2;
	edge.a = originalTexture.a;
	vec4 edgeColorArea = edge * edgeColor;
	originalTexture.a *= step1.r;
	vec4 combinedColor = mix(originalTexture, edgeColorArea, edge.r);
	
	ALPHA = step1.r;
	ALBEDO = combinedColor.rgb;
}