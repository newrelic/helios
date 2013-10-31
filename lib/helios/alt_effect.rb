{\rtf1\ansi\ansicpg1252\cocoartf1187\cocoasubrtf400
{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww17600\viewh12360\viewkind0
\deftab720
\pard\pardeftab720

\f0\fs24 \cf0 module Helios\
\'a0\'a0class AltEffect < Effect\
\'a0\'a0\'a0\'a0def initialize(args)\
\'a0\'a0\'a0\'a0\'a0\'a0@odd_red = args['r'].to_i\
\'a0\'a0\'a0\'a0\'a0\'a0@odd_green = args['g'].to_i\
\'a0\'a0\'a0\'a0\'a0\'a0@odd_blue = args['b'].to_i\
\'a0\'a0\'a0\'a0\'a0\'a0@even_red = args['r1'].to_i\
\'a0\'a0\'a0\'a0\'a0\'a0@even_green = args['g1'].to_i\
\'a0\'a0\'a0\'a0\'a0\'a0@even_blue = args['b1'].to_i\
\'a0\'a0\'a0\'a0\'a0\'a0@iterations = args['iterations']\
\'a0\'a0\'a0\'a0\'a0\'a0@interval = args.fetch('interval', 0.05)\
\'a0\'a0\'a0\'a0\'a0\'a0lights = args.fetch('lights', [1, '..', 25])\
\'a0\'a0\'a0\'a0\'a0\'a0@lights = get_lights(lights)\
\'a0\'a0\'a0\'a0end\
\
\'a0\'a0\'a0\'a0def change!\
\'a0\'a0\'a0\'a0\'a0\'a0odd_color = [@odd_red, @odd_green, @odd_blue]\
\pard\pardeftab720
\cf0 \'a0\'a0\'a0\'a0\'a0\'a0even_color = [@even_red, @even_green, @even_blue]\
\pard\pardeftab720
\cf0 \
\'a0\'a0\'a0\'a0\'a0\'a0@iterations.times do\
\pard\pardeftab720
\cf0 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0alt_colors(odd_color, even_color)\
	   sleep @interval\
\pard\pardeftab720
\cf0 \'a0\'a0\'a0\'a0\'a0\'a0end\
\'a0\'a0\'a0\'a0end\
\pard\pardeftab720
\cf0 \
\pard\pardeftab720
\cf0 \'a0\'a0\'a0\'a0def alt_colors(odd_color, even_color)\
\'a0\'a0\'a0\'a0\'a0\'a0@lights.step(2).each do |light|\
\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0set_light(light, odd_color)\
\pard\pardeftab720
\cf0 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0set_light(light.next, even_color)\
\pard\pardeftab720
\cf0 \'a0\'a0\'a0\'a0\'a0\'a0end\
\'a0\'a0\'a0\'a0end\
\
\'a0\'a0end\
end\
}