# Encoding: UTF-8

[{content: "abstract ",
  name: "abstract",
  scope: "source.java",
  tabTrigger: "ab",
  uuid: "E54D7A3C-107A-426E-91E8-D066A978BC5E"},
 {content: 
   "assert ${1:test}${2/(.+)/(?1: \\: \")/}${2:Failure message}${2/(.+)/(?1:\")/};$0",
  name: "assert",
  scope: "source.java",
  tabTrigger: "as",
  uuid: "A30E90E6-FFBF-4899-AB97-7CAA00D0B824"},
 {content: "break;\n",
  name: "break",
  scope: "source.java",
  tabTrigger: "br",
  uuid: "E4DACBFB-F029-4EC3-BB0D-BEF0D5369DA7"},
 {content: "case $1:\n\t$2\n$0",
  name: "case",
  scope: "source.java",
  tabTrigger: "cs",
  uuid: "7396532C-3567-4BDA-9C10-51454A2F2F6D"},
 {content: "catch (${1:Exception} ${2:e}) {\n\t$0\n}",
  name: "catch",
  scope: "source.java",
  tabTrigger: "ca",
  uuid: "CE3059F1-EBFE-426B-A98A-7D935580F915"},
 {content: 
   "class ${1:${TM_FILENAME/(.*?)(\\..+)/$1/}} ${2:extends ${3:Parent} }${4:implements ${5:Interface} }{\n\t$0\n}",
  name: "class",
  scope: "source.java",
  tabTrigger: "cl",
  uuid: "E9ED01EA-E83B-4322-BD9D-39C88FB8C237"},
 {content: "static public final String ${1:var} = \"$2\";$0",
  name: "constant string",
  scope: "source.java",
  tabTrigger: "cos",
  uuid: "4876099F-502E-471F-9D0D-916C7EF2E353"},
 {content: "static public final ${1:String} ${2:var} = $3;$0",
  name: "constant",
  scope: "source.java",
  tabTrigger: "co",
  uuid: "8CD02FE6-B5EE-4335-AFDF-7CC02C969563"},
 {content: "default:\n\t$0",
  name: "default",
  scope: "source.java",
  tabTrigger: "de",
  uuid: "F050CAEB-56AB-40A7-846B-E5DB70FA0A90"},
 {content: "else if ($1) {\n\t$0\n}",
  name: "else if",
  scope: "source.java",
  tabTrigger: "elif",
  uuid: "4C07C9CB-4306-417B-B152-653E93C987B5"},
 {content: "else {\n\t$0\n}",
  name: "else",
  scope: "source.java",
  tabTrigger: "el",
  uuid: "5A7786EE-5F23-422E-A6EC-69778ED7C8FC"},
 {content: "final ",
  name: "final",
  scope: "source.java",
  tabTrigger: "fi",
  uuid: "F53E8BF9-4911-4131-B31F-8B4DEE47E421"},
 {content: "for ($1 : $2) {\n\t$0\n}",
  name: "for (each)",
  scope: "source.java",
  tabTrigger: "fore",
  uuid: "8B84EAD3-F93D-407A-8BB1-4FEF8B0C71D7"},
 {content: "for ($1; $2; $3) {\n\t$0\n}",
  name: "for",
  scope: "source.java",
  tabTrigger: "for",
  uuid: "BC9380F7-43F1-4304-91CD-4C490B0A6037"},
 {content: "if ($1) {\n\t$0\n}",
  name: "if",
  scope: "source.java",
  tabTrigger: "if",
  uuid: "476E26EB-5A53-45B3-A497-B22B12815C7F"},
 {content: "import junit.framework.TestCase;\n$0",
  name: "import junit.framework.TestCase;",
  scope: "source.java",
  tabTrigger: "imt",
  uuid: "D8E7B79D-ADEC-437D-BFDE-F20D5362D892"},
 {content: "import ",
  name: "import",
  scope: "source.java",
  tabTrigger: "im",
  uuid: "097F4236-D7A4-412F-A078-11ABFCAFC7BA"},
 {content: 
   "interface ${1:${TM_FILENAME/(.*?)(\\..+)/$1/}} ${2:extends ${3:Parent} }{\n\t$0\n}",
  name: "interface",
  scope: "source.java",
  tabTrigger: "in",
  uuid: "B8E49466-FCBE-4053-AEC3-4ABBE0FF2FEF"},
 {content: "java.beans.",
  name: "java.beans.",
  scope: "source.java",
  tabTrigger: "j.b",
  uuid: "5EEDE297-9489-41C8-A7AF-BDB5EABEF41F"},
 {content: "java.io.",
  name: "java.io.",
  scope: "source.java",
  tabTrigger: "j.i",
  uuid: "2887D1D3-A714-41B6-9211-4DEC12417889"},
 {content: "java.math.",
  name: "java.math.",
  scope: "source.java",
  tabTrigger: "j.m",
  uuid: "592F2823-7A2B-4881-99A4-7A18D3623902"},
 {content: "java.net.",
  name: "java.net.",
  scope: "source.java",
  tabTrigger: "j.n",
  uuid: "94C09B88-AC93-4045-86D1-206639D582D0"},
 {content: "java.util.",
  name: "java.util.",
  scope: "source.java",
  tabTrigger: "j.u",
  uuid: "97DC6637-998E-493C-9765-C8CFB29AC18C"},
 {content: "public static void main(String[] args) {\n\t$0\n}",
  name: "method (main)",
  scope: "source.java",
  tabTrigger: "main",
  uuid: "90A0278A-56B2-465B-B629-A01DF6524FEA"},
 {content: "${1:void} ${2:method}($3) ${4:throws $5 }{\n\t$0\n}\n",
  name: "method",
  scope: "source.java",
  tabTrigger: "m",
  uuid: "16D51B5E-56BC-4ED0-84FB-FCC68479BE8E"},
 {content: "package ",
  name: "package",
  scope: "source.java",
  tabTrigger: "pa",
  uuid: "F2C18E05-A7E7-4898-8CB5-CC7E6020AAFE"},
 {content: "System.out.print($1);$0",
  name: "print",
  scope: "source.java",
  tabTrigger: "p",
  uuid: "5F390B93-6A28-4EED-B04A-D213640B9DAF"},
 {content: "System.out.println($1);$0",
  name: "println",
  scope: "source.java",
  tabTrigger: "pl",
  uuid: "DFD7AE0D-D5CC-4FFF-B37D-EA7ACC8E34DF"},
 {content: "private ",
  name: "private",
  scope: "source.java",
  tabTrigger: "pr",
  uuid: "8E765795-CC9D-46D7-8602-7E2DBB7026B2"},
 {content: "protected ",
  name: "protected",
  scope: "source.java",
  tabTrigger: "po",
  uuid: "56C938B4-22B8-45F4-8E09-5BB4DE4633B0"},
 {content: "public ",
  name: "public",
  scope: "source.java",
  tabTrigger: "pu",
  uuid: "BD7A6DBE-0180-4E1A-A428-14D44BD88F88"},
 {content: "return ",
  name: "return",
  scope: "source.java",
  tabTrigger: "re",
  uuid: "BF745BD9-E345-4CFB-82B1-2CC2195BEFA8"},
 {content: "static ",
  name: "static",
  scope: "source.java",
  tabTrigger: "st",
  uuid: "C0525A43-EEF4-4F59-AC09-84D263888433"},
 {content: "switch ($1) {\n\t$0\n}",
  name: "switch",
  scope: "source.java",
  tabTrigger: "sw",
  uuid: "2D2F53B7-E41C-4AEE-8A5E-2A5BB7B42E65"},
 {content: "synchronized ",
  name: "synchronized",
  scope: "source.java",
  tabTrigger: "sy",
  uuid: "96251D07-2F30-4610-9F0F-65DE730CC0B5"},
 {content: 
   "public class ${1:${TM_FILENAME/(.*?)(\\..+)/$1/}} extends ${2:TestCase} {\n\t$0\n}",
  name: "test case",
  scope: "source.java",
  tabTrigger: "tc",
  uuid: "D3D659F5-5318-4D0A-85E2-9A03902A1668"},
 {content: "public void test${1:Name}() throws Exception {\n\t$0\n}",
  name: "test",
  scope: "source.java",
  tabTrigger: "t",
  uuid: "8B285F69-5A6A-46B4-BB31-B5F10DCB5719"},
 {content: "throw $0",
  name: "throw",
  scope: "source.java",
  tabTrigger: "th",
  uuid: "F0C15D98-790E-4755-A04E-B8903D50F5C6"},
 {content: "${1:String} ${2:var}${3: = ${0:null}};",
  name: "variable",
  scope: "source.java",
  tabTrigger: "v",
  uuid: "3621828B-39DB-4B56-8300-DD5C76333868"},
 {content: "while ($1) {\n\t$0\n}",
  name: "while",
  scope: "source.java",
  tabTrigger: "wh",
  uuid: "755B1EB0-934C-49C6-AD08-B461C2205C46"}]