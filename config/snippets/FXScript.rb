# Encoding: UTF-8

[{content: 
   "Add(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});",
  name: "Add",
  scope: "source.fxscript",
  tabTrigger: "add",
  uuid: "C057A470-0066-4D34-A3BC-D1A6D98FC834"},
 {content: 
   "input ${1:varname}, \"${2:${1/varname/text label/}}\", Angle, ${3:default value}, ${4:min value}, ${5:max value};\n",
  name: "Angle",
  scope: "source.fxscript",
  tabTrigger: "input",
  uuid: "700E5067-6AF4-4A03-9387-4BEFA4B55BCA"},
 {content: "AspectOf(${1:dest});",
  name: "AspectOf(dest)",
  scope: "source.fxscript",
  tabTrigger: "aspectof",
  uuid: "8F6C9982-167C-4266-950C-5073AC5125BA"},
 {content: 
   "BlitRect(${1:sourceImage}, ${2:sourcePoly}, ${3:destImage}, ${4:destPoly});\n",
  name: "BlitRect",
  scope: "source.fxscript",
  tabTrigger: "blitrect",
  uuid: "5F1E25B9-E356-4B1F-9BA0-9B3ACB045523"},
 {content: 
   "BlurChannel(${1:srcImage}, ${2:destImage}, ${3:radius}, ${4:doAlpha}, ${5:doRed}, ${6:doGreen}, ${7:doBlue}, ${8:AspectOf(${9:dest})});\n",
  name: "BlurChannel",
  scope: "source.fxscript",
  tabTrigger: "blur",
  uuid: "102CD34A-DE6E-4E07-96BF-3BA54AB57501"},
 {content: "BoundsOf(${1:image}, ${2:result});",
  name: "BoundsOf",
  scope: "source.fxscript",
  tabTrigger: "boundsof",
  uuid: "5396B08F-29B8-45B9-B02D-07B727DD907A"},
 {content: 
   "BumpMap(${1:srcImage}, ${2:destImage}, ${3:mapImage}, ${4:repeatEdges}, ${5:angle}, ${6:scale}, ${7:lumaScale}, ${8:AspectOf($2)});\n",
  name: "BumpMap",
  scope: "source.fxscript",
  tabTrigger: "bumpmap",
  uuid: "0203808F-1EF2-47DA-9D18-C2C878AD0031"},
 {content: 
   "ChannelCopy(${1:srcIMG}, ${2:destIMG}, ${3:channel2Alpha}, ${4:channel2Red}, ${5:channel2Green}, ${6:channel2Blue});\n",
  name: "ChannelCopy",
  scope: "source.fxscript",
  tabTrigger: "channelcopy",
  uuid: "E445C3D8-A47A-4766-BC3A-5B661110EEEB"},
 {content: 
   "ChannelFill(${1:destImage}, ${2:a0-255}, ${3:r0-255}, ${4:g0-255}, ${5:b0-255});\n",
  name: "ChannelFill",
  scope: "source.fxscript",
  tabTrigger: "channelfill",
  uuid: "E3BCB1BC-7AB9-4EEF-B995-5145ED3C80C7"},
 {content: 
   "ChannelMultiply(${1:srcImage}, ${2:destImage}, ${3:alphaValue}, ${4:redValue}, ${5:greenValue}, ${6:blueValue});",
  name: "ChannelMultiply",
  scope: "source.fxscript",
  tabTrigger: "channelmultiply",
  uuid: "E4815028-FEBF-410B-80FC-9AD4C11F724A"},
 {content: 
   "input ${1:varname}, \"${2:${1/varname/text label/}}\", Checkbox, ${3:0};\n",
  name: "Checkbox",
  scope: "source.fxscript",
  tabTrigger: "input",
  uuid: "A03B190B-E834-4502-856C-43545F86A5CC"},
 {content: "input ${1:varName}, \"${2:${1/varname/text label/}}\", Clip;\n",
  name: "Clip",
  scope: "source.fxscript",
  tabTrigger: "input",
  uuid: "F4A7A838-0A5D-4AEA-8F57-3AE05AC6590A"},
 {content: 
   "input ${1:varname}, \"${2:${1/varname/text label/}}\", Color, ${3:A}, ${4:R}, ${5:G}, ${6:B};\n",
  name: "Color",
  scope: "source.fxscript",
  tabTrigger: "input",
  uuid: "45428D9B-CD3E-432C-A421-6C0A7019C806"},
 {content: "ColorOf(${1:image}, ${2:point}, ${3:color});",
  name: "ColorOf",
  scope: "source.fxscript",
  tabTrigger: "colorof",
  uuid: "EAF8AA08-9505-40F3-8289-90931AF7F0F6"},
 {content: 
   "ColorTransform(${1:srcImage}, ${2:destImage}, ${3:matrix}, ${4:float[3]}, ${5:$4});",
  name: "ColorTransform",
  scope: "source.fxscript",
  tabTrigger: "colortransform",
  uuid: "95AD96B7-AE5C-4F20-8919-0F61A474FCAA"},
 {content: "ConvertImage(${1:src1}, ${2:dest}, ${3:colorspace});",
  name: "ConvertImage",
  scope: "source.fxscript",
  tabTrigger: "convertimage",
  uuid: "274A0C5C-1439-461E-B1EC-494DE45B8EF7"},
 {content: 
   "Darken(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});",
  name: "Darken",
  scope: "source.fxscript",
  tabTrigger: "darken",
  uuid: "9C53297A-5990-400D-AF98-76C4B000669D"},
 {content: "DebugText(\"${1:label}\", ${2:float value});",
  name: "DebugText",
  scope: "source.fxscript",
  tabTrigger: "debug",
  uuid: "37F2F4D3-9853-4961-8F7A-AABB0300D0FC"},
 {content: 
   "Difference(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:kAlpha});",
  name: "Difference",
  scope: "source.fxscript",
  tabTrigger: "difference",
  uuid: "9D4DA4E7-E521-42EB-8FF6-5991B0B31DA5"},
 {content: "DimensionsOf(${1:Dest}, ${2:Width}, ${3:Height});",
  name: "DimensionsOf",
  scope: "source.fxscript",
  tabTrigger: "dimsof",
  uuid: "841D77E5-0FAA-4D55-BEFB-01D7C2618F87"},
 {content: 
   "float ${1:w}, ${2:h};\nDimensionsOf(${3:dest}, $1, $2);\nimage ${4:img0}[$1][$2];\n",
  name: "DimensionsOf() w/ float vars",
  scope: "source.fxscript",
  tabTrigger: "dimsof",
  uuid: "1E65AC5C-A779-42C8-809C-0AA198107A6E"},
 {content: 
   "point ${1:w};\nDimensionsOf(${2:dest}, $1.x, $1.y);\nimage ${3:img0}[$1.x][$1.y];\n",
  name: "DimensionsOf() w/ point vars",
  scope: "source.fxscript",
  tabTrigger: "dimsof",
  uuid: "7353C10B-D130-432F-96BD-4A769A22D0BC"},
 {content: 
   "Displace(${1:srcImage}, ${2:destImage}, ${3:mapImage}, ${4:repeatEdges}, ${5:xScale}, ${6:yScale}, ${7:lumaScale}, ${8:AspectOf($2)});\n",
  name: "Displace",
  scope: "source.fxscript",
  tabTrigger: "displace",
  uuid: "E632987B-755A-41C0-ACD1-3F65304FCBD3"},
 {content: 
   "DrawSoftDot(${1:dest}, ${2:point/poly}, ${3:shape}, ${4:size}, ${5:softness}, ${6:subSteps}, ${7:color(s)}, ${8:opacity(s)}, ${9:aspectOf(${10:$1})});",
  name: "DrawSoftSpot",
  scope: "source.fxscript",
  tabTrigger: "drawsoftdot",
  uuid: "E678D4CC-8981-48A2-B7CE-060DBF8D6F53"},
 {content: "FillPoly(${1:poly}, ${2:image}, ${3:color});\n",
  name: "FillPoly",
  scope: "source.fxscript",
  tabTrigger: "fillpoly",
  uuid: "A76BFE87-61A6-4D52-B921-D8AC6E13B8FB"},
 {content: "Filter \"${1:Name}\";\nGroup \"${2:Name}\";\n",
  name: "Filter",
  scope: "source.fxscript",
  tabTrigger: "filter",
  uuid: "55E54D27-5564-48FA-9708-245CE03CF999"},
 {content: "FramePoly(${1:poly}, ${2:image}, ${3:color}, ${4:width});",
  name: "FramePoly",
  scope: "source.fxscript",
  tabTrigger: "framepoly",
  uuid: "9659B554-7CB0-4797-B47C-B264840E7912"},
 {content: "Generator \"${1:Name}\";\nGroup \"${2:Name}\";\n",
  name: "Generator",
  scope: "source.fxscript",
  tabTrigger: "generator",
  uuid: "8265E927-C628-4028-B12C-60C233BAA124"},
 {content: "GetPixelFormat(${1:src1});",
  name: "GetPixelFormat",
  scope: "source.fxscript",
  tabTrigger: "getpixelformat",
  uuid: "A7E0BF12-EE72-49D7-94B2-14136FA690BA"},
 {content: "GetVideo(${1:srcClip}, ${2:timeOffset}, ${3:destImage});",
  name: "GetVideo",
  scope: "source.fxscript",
  tabTrigger: "getvideo",
  uuid: "38903FDD-A0E3-4594-9FB2-ACE8D9A27B27"},
 {content: "ImageAnd(${1:srcImage1}, ${2:srcImage2}, ${3:destImage});",
  name: "ImageAnd",
  scope: "source.fxscript",
  tabTrigger: "imageand",
  uuid: "B878BD4C-21A2-4F3A-8A45-636EC899DF4A"},
 {content: "InformationFlag(\"YUVaware\");\n",
  name: "InformationFlag(\"YUVaware\")",
  scope: "source.fxscript",
  tabTrigger: "info",
  uuid: "2526F035-4131-468E-9CAA-A9E8FE42D17B"},
 {content: "InformationFlag(\"dontEraseDest\");\n",
  name: "InformationFlag(\"dontEraseDest\")",
  scope: "source.fxscript",
  tabTrigger: "info",
  uuid: "E1E768CA-F914-4080-AB3D-00A795951810"},
 {content: "InformationFlag(\"hasfields\");\n",
  name: "InformationFlag(\"hasfields\")",
  scope: "source.fxscript",
  tabTrigger: "info",
  uuid: "DE0C3E02-E0D3-458C-BCC6-FD6B865919BC"},
 {content: "InformationFlag(\"requiresYUV\");\n",
  name: "InformationFlag(\"requiresYUV\")",
  scope: "source.fxscript",
  tabTrigger: "info",
  uuid: "0472BDC3-16AA-42F9-ADDE-1ABA30C0B348"},
 {content: "Interpolate(${1:p1}, ${2:p2}, ${3:percent}, ${4:result});",
  name: "Interpolate",
  scope: "source.fxscript",
  tabTrigger: "interpolate",
  uuid: "7732A822-C4DE-41B2-9948-AF3DC790175D"},
 {content: 
   "InvertChannel(${1:srcImage}, ${2:destImage}, ${3:doAlpha}, ${4:doRed}, ${5:doGreen}, ${6:doBlue});\n",
  name: "InvertChannel",
  scope: "source.fxscript",
  tabTrigger: "invertchannel",
  uuid: "7B5F1EEB-09A5-41D8-A724-150B41620068"},
 {content: "input label_`date +%s`, \"${1:Visible Text}\", Label, \"\";\n",
  name: "Label",
  scope: "source.fxscript",
  tabTrigger: "input",
  uuid: "2F1E3D94-3F4C-4001-8529-0DBDA797EABD"},
 {content: 
   "LevelMap(${1:src}, ${2:dest}, ${3:alphaMap[256]}, ${4:redMap[256]}, ${5:greenMap[256]}, ${6:blueMap[256]});",
  name: "LevelMap",
  scope: "source.fxscript",
  tabTrigger: "levelmap",
  uuid: "6EF29651-DF4B-46D8-BB28-CD0F5B0DCC35"},
 {content: 
   "Lighten(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});",
  name: "Lighten",
  scope: "source.fxscript",
  tabTrigger: "lighten",
  uuid: "CB07B4F7-E612-47F0-B148-34E70EFA1825"},
 {content: 
   "MakeRect(${1:result}, ${2:left}, ${3:top}, ${4:width}, ${5:height});",
  name: "MakeRect",
  scope: "source.fxscript",
  tabTrigger: "makerect",
  uuid: "C1F4D5B2-58AD-4B40-A8F8-EEC252E11483"},
 {content: 
   "Matte(${1:TopImage}, ${2:BottomImage}, ${3:destImage}, ${4:amount}, ${5:kAlpha});",
  name: "Matte",
  scope: "source.fxscript",
  tabTrigger: "matte",
  uuid: "D21F0582-A1CC-442D-8DE9-21DBAF34CDB5"},
 {content: 
   "Multiply(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});",
  name: "Multiply",
  scope: "source.fxscript",
  tabTrigger: "multiply",
  uuid: "E7BBD673-2D91-4752-B0E4-D90B5F7F3406"},
 {content: 
   "Overlay(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});",
  name: "Overlay",
  scope: "source.fxscript",
  tabTrigger: "overlay",
  uuid: "C24BFE3B-41A9-4E45-9872-759D449510E7"},
 {content: 
   "input ${1:varname}, \"${2:${1/varname/text label/}}\", Point, ${3:X}, ${4:Y};\n",
  name: "Point",
  scope: "source.fxscript",
  tabTrigger: "input",
  uuid: "3FDDEFD4-6C98-402F-8FBE-C40E69651052"},
 {content: 
   "input ${1:varname}, \"${2:${1/varname/text label/}}\", Popup, ${3:[numeric index]}, \"${4:string 1}\"${5:, \"${6:string 2}\"${7:, \"${8:string 3}\"${9:, \"${10:string 4}\"${11:, \"${12:string 5}\"${13:, \"${14:string 6}\"}}}}};\n",
  name: "Popup",
  scope: "source.fxscript",
  tabTrigger: "input",
  uuid: "435E0864-5903-4A80-BB9D-FA47A6AF1FDD"},
 {content: 
   "input ${1:varname}, \"${2:${1/varname/text label/}}\", RadioGroup, ${3:[numeric index]}, \"${4:string 1}\"${5:, \"${6:string 2}\"${7:, \"${8:string 3}\"${9:, \"${10:string 4}\"${11:, \"${12:string 5}\"${13:, \"${14:string 6}\"}}}}};\n",
  name: "RadioGroup",
  scope: "source.fxscript",
  tabTrigger: "input",
  uuid: "B733EA72-CDAD-48B9-84B1-4696C65F2914"},
 {content: 
   "Repeat While (${1:Condition})\n\t${0:${TM_SELECTED_TEXT/(.*)$/$1/: // insert code here}}\nEnd Repeat;",
  name: "Repeat While",
  scope: "source.fxscript",
  tabTrigger: "repeat",
  uuid: "74D5E8B6-39DB-4A78-B5C7-10C89A60878D"},
 {content: 
   "Screen(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});",
  name: "Screen",
  scope: "source.fxscript",
  tabTrigger: "screen",
  uuid: "EC5EE9C6-52D7-406F-8D2D-17112DA8D674"},
 {content: "SetPixelFormat(${1:dest}, ${2:colorspace});",
  name: "SetPixelFormat",
  scope: "source.fxscript",
  tabTrigger: "setpixelformat",
  uuid: "E3F28EA4-A9A3-483E-826D-5D2666724146"},
 {content: 
   "input ${1:varname}, \"${2:${1/varname/text label/}}\", Slider, ${3:default value}, ${4:min value}, ${5:max value}${6: ramp ${7:number}}${8: label \"${9:units}\"}${10: detent ${11:number}};\n",
  name: "Slider",
  scope: "source.fxscript",
  tabTrigger: "input",
  uuid: "32D9C004-FBB8-4A95-81A4-503E45F46530"},
 {content: 
   "Subtract(${1:srcImage1}, ${2:srcImage2}, ${3:destImage}, ${4:amount}, ${5:kAlpha});",
  name: "Subtract",
  scope: "source.fxscript",
  tabTrigger: "subtract",
  uuid: "A71CF32D-CBBE-4EC5-B4F5-1BAC96E5672E"},
 {content: "Transition \"${1:Name}\";\nGroup \"${2:Name}\";\n",
  name: "Transition",
  scope: "source.fxscript",
  tabTrigger: "transition",
  uuid: "863C384C-A6CD-4D9F-AD79-841CDB10CE65"},
 {content: "\ncode\n\n",
  name: "code",
  scope: "source.fxscript",
  tabTrigger: "code",
  uuid: "F7EB9453-34E5-496D-A588-665E83A3859D"},
 {content: "ProducesAlpha;\n\ncode\n\nexposedBackground=1;\n",
  name: "code:ProducesAlpha",
  scope: "source.fxscript",
  tabTrigger: "code",
  uuid: "56BC2A5F-A634-4D1C-B264-F303ADBBD75C"},
 {content: 
   "for ${1:var} = ${2:min} to ${3:max}\n\t${0:${TM_SELECTED_TEXT/(.*)$/$1/: // insert code here}}\nnext;",
  name: "for ... next",
  scope: "source.fxscript",
  tabTrigger: "for",
  uuid: "317C63E1-3870-4A66-A66C-4605D0E07BBE"},
 {content: 
   "if (${1:Condition})\n\t${2:${TM_SELECTED_TEXT/(.*)$/$1/: // code}}\nelse ${3:if (${4:condition})}\n\t${5: // code}\nend if\n",
  name: "if ... else ... end",
  scope: "source.fxscript",
  tabTrigger: "ife",
  uuid: "BD010766-1AA4-485C-9086-043E0B151537"},
 {content: 
   "if (${1:Condition})\n\t${0:${TM_SELECTED_TEXT/(.*)$/$1/: // insert code here}}\nend if\n",
  name: "if ... end",
  scope: "source.fxscript",
  tabTrigger: "if",
  uuid: "2A9F9CFB-9853-4652-BF39-C1CA15E31D12"},
 {content: "kFloat2",
  name: "kFloat2",
  scope: "source.fxscript",
  tabTrigger: "kfloat",
  uuid: "32203D39-7E44-4958-AB59-CB28EB5CB844"},
 {content: "kFloat4",
  name: "kFloat4",
  scope: "source.fxscript",
  tabTrigger: "kfloat",
  uuid: "84FFACEC-E910-4DCE-AE1E-BC01C83C63EF"},
 {content: "kFloat6",
  name: "kFloat6",
  scope: "source.fxscript",
  tabTrigger: "kfloat",
  uuid: "E3333819-A50E-4138-ADE5-70C02D7F06AE"},
 {content: "kFormatRGB219",
  name: "kFormatRGB219",
  scope: "source.fxscript",
  tabTrigger: "kformat",
  uuid: "B9D8441C-151E-4275-B395-F9234EEBE073"},
 {content: "kFormatRGB255",
  name: "kFormatRGB255",
  scope: "source.fxscript",
  tabTrigger: "kformat",
  uuid: "5B0AD9DB-51AC-4E5E-8CA6-E5A3EA068616"},
 {content: "kFormatYUV219",
  name: "kFormatYUV219",
  scope: "source.fxscript",
  tabTrigger: "kformat",
  uuid: "ED1E4E46-5745-4821-8DE3-EE1DC1B66FED"},
 {content: "kInteger",
  name: "kInteger",
  scope: "source.fxscript",
  tabTrigger: "kfloat",
  uuid: "8AF84414-440E-47AB-A71F-DF3BDB6A103E"},
 {content: "Line(${1:p1}, ${2:p2}, ${3:image}, ${4:color}, ${5:width});",
  name: "line",
  scope: "source.fxscript",
  tabTrigger: "line",
  uuid: "2572F624-B65B-46C1-BF97-5FAEF3EAEA72"}]
