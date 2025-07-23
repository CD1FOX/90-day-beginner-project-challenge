shader_type canvas_item;

uniform bool flash = false;
uniform float strength = 1.0;

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);

	if (flash){
		vec4 red_color = vec4(1.0, 0.0, 0.0, tex_color.a);
		COLOR = mix(tex_color, red_color, strength);
	}else{
		COLOR = tex_color;
	}
}