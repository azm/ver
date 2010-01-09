# Encoding: UTF-8

[{content: "${1:FIELDNAME} = models.AutoField()",
  name: "AutoField",
  scope: "source.python.django",
  tabTrigger: "auto",
  uuid: "5D4F70FB-4A51-41D4-B729-920F827E70D2"},
 {content: "${1:FIELDNAME} = models.BooleanField(${2:default=True})",
  name: "BooleanField",
  scope: "source.python.django",
  tabTrigger: "boolean",
  uuid: "27531D3B-899B-4872-A16D-7275E4E91B02"},
 {content: 
   "${1:FIELDNAME} = models.CharField(${2:blank=True}, max_length=${3:100})",
  name: "CharField",
  scope: "source.python.django",
  tabTrigger: "char",
  uuid: "97FCBFBC-BBEE-408B-BF5D-203D895FCFBA"},
 {content: "${1:FIELDNAME} = models.CommaSeparatedIntegerField(max_length=$2)",
  name: "CommaSeparatedIntegerField",
  scope: "source.python.django",
  tabTrigger: "commaseparatedinteger",
  uuid: "8FA6C6F3-4F38-4560-A565-39FB0C498B74"},
 {content: 
   "${1:FIELDNAME} = models.DateField(${2:default=datetime.datetime.today})",
  name: "DateField",
  scope: "source.python.django",
  tabTrigger: "date",
  uuid: "25D5C228-A652-421D-ACC1-924FC5FEBEBE"},
 {content: 
   "${1:FIELDNAME} = models.DateTimeField(${2:blank=True}${3:, default=datetime.datetime.now})",
  name: "DateTimeField",
  scope: "source.python.django",
  tabTrigger: "datetime",
  uuid: "2F382BC6-3AD6-4012-9663-DF2FD744B591"},
 {content: 
   "${1:FIELDNAME} = models.DecimalField(max_digits=$2, decimal_places=$3)",
  name: "DecimalField",
  scope: "source.python.django",
  tabTrigger: "decimal",
  uuid: "0C28D967-6886-42A9-B74F-6E47C649962E"},
 {content: "${1:FIELDNAME} = models.EmailField()",
  name: "EmailField",
  scope: "source.python.django",
  tabTrigger: "email",
  uuid: "23AA908D-8DC6-4657-89A4-83214B85497D"},
 {content: 
   "${1:FIELDNAME} = models.FileField(upload_to=${1:/path/for/upload})",
  name: "FileField",
  scope: "source.python.django",
  tabTrigger: "file",
  uuid: "CD1F651A-9D70-460B-A1AA-92E77908BA6A"},
 {content: 
   "${1:FIELDNAME} = models.FilePathField(path=\"${1:/location/of/choices}\"${2:, match=\"${3:regex}\"}${4:, recursive=True})",
  name: "FilePathField",
  scope: "source.python.django",
  tabTrigger: "filepath",
  uuid: "D9BD861A-B03E-4765-92B2-55AE10067066"},
 {content: "${1:FIELDNAME} = models.FloatField()",
  name: "FloatField",
  scope: "source.python.django",
  tabTrigger: "float",
  uuid: "B2BDB25E-E626-443B-8B6D-2E09FD75876A"},
 {content: "${1:FIELDNAME} = models.ForeignKey(${2:RELATED_MODEL})",
  name: "ForeignKey",
  scope: "source.python.django",
  tabTrigger: "fk",
  uuid: "F497C0D3-812E-4339-8260-8D906337023B"},
 {content: "${1:FIELDNAME} = models.IPAddressField(${2:blank=True})",
  name: "IPAddressField",
  scope: "source.python.django",
  tabTrigger: "ipaddress",
  uuid: "6C53B5EA-B8CD-4FC8-903B-1967FD9E421F"},
 {content: 
   "${1:FIELDNAME} = models.ImageField(upload_to=\"${2:/dir/path}\"${3:, height_field=$4}${5:, width_field=$6})",
  name: "ImageField",
  scope: "source.python.django",
  tabTrigger: "image",
  uuid: "1E41208D-8E7E-42ED-A23C-376075EC6ADB"},
 {content: "${1:FIELDNAME} = models.IntegerField(${2:blank=True, null=True})",
  name: "IntegerField",
  scope: "source.python.django",
  tabTrigger: "integer",
  uuid: "636921D5-6D30-44DC-B49A-4188DF6A8477"},
 {content: "${1:FIELDNAME} = models.ManyToManyField(${2:RELATED_MODEL})",
  name: "ManyToManyField",
  scope: "source.python.django",
  tabTrigger: "manytomany",
  uuid: "449AB31C-BAB7-4D30-AF04-6A070CBE4EF4"},
 {content: 
   "class ${1:Modelname}(models.Model):\n\t\"\"\"${2:($1 description)}\"\"\"\n\t$0\n\n\tclass Admin:\n\t\tlist_display = ('',)\n\t\tsearch_fields = ('',)\n\n\tdef __unicode__(self):\n\t\treturn u\"$1\"\n",
  name: "Model Skeleton",
  scope: "source.python.django",
  tabTrigger: "model",
  uuid: "311C17C5-A556-48D4-B91F-DD28BB0CF4E7"},
 {content: "${1:FIELDNAME} = models.NullBooleanField(${2:default=True})",
  name: "NullBooleanField",
  scope: "source.python.django",
  tabTrigger: "nullboolean",
  uuid: "21013818-A691-4E96-A889-70A0F2F28557"},
 {content: "${1:FIELDNAME} = models.PhoneNumberField(${2:blank=True})",
  name: "PhoneNumberField",
  scope: "source.python.django",
  tabTrigger: "phonenumber",
  uuid: "611E7330-56E2-4B20-A364-265666458121"},
 {content: 
   "${1:FIELDNAME} = models.PositiveIntegerField(${2:blank=True, null=True})",
  name: "PositiveIntegerField",
  scope: "source.python.django",
  tabTrigger: "positiveinteger",
  uuid: "4EFDEB25-E308-4708-9F2F-594582B5CCE0"},
 {content: 
   "${1:FIELDNAME} = models.PositiveSmallIntegerField(${2:blank=True, null=True})",
  name: "PositiveSmallIntegerField",
  scope: "source.python.django",
  tabTrigger: "positivesmallinteger",
  uuid: "9F2FB381-651B-420F-9835-0CADEA5DF7EF"},
 {content: "${1:slug} = models.SlugField(${2:prepopulate_from=(\"$3\",$4)})",
  name: "SlugField",
  scope: "source.python.django",
  tabTrigger: "slug",
  uuid: "8F14D580-0910-40DE-95B4-10825F3CD656"},
 {content: 
   "${1:FIELDNAME} = models.SmallIntegerField(${2:blank=True, null=True})",
  name: "SmallIntegerField",
  scope: "source.python.django",
  tabTrigger: "smallinteger",
  uuid: "E9B61D15-B2CC-4202-9F2D-9AE2C09219BF"},
 {content: "${1:FIELDNAME} = models.TextField(${2:blank=True})",
  name: "TextField",
  scope: "source.python.django",
  tabTrigger: "text",
  uuid: "A15C10E8-4DC9-4C9B-A47E-A47F14663AFE"},
 {content: "${1:FIELDNAME} = models.TimeField(${2:blank=True})",
  name: "TimeField",
  scope: "source.python.django",
  tabTrigger: "time",
  uuid: "343CDE2F-C489-4437-B316-2881C5F1C854"},
 {content: 
   "${1:FIELDNAME} = models.URLField(${2:blank=True}, verify_exists=${3:True})",
  name: "URLField",
  scope: "source.python.django",
  tabTrigger: "url",
  uuid: "4D06CE4E-A856-4607-8D58-A03ED5EB90B1"},
 {content: "${1:FIELDNAME} = models.USStateField(${2:blank=True})",
  name: "USStateField",
  scope: "source.python.django",
  tabTrigger: "usstate",
  uuid: "2F2B9569-8D5D-423E-8B36-75C59BAE9FE4"},
 {content: 
   "${1:FIELDNAME} = models.XMLField(schema_path=${2:/path/to/RelaxNG}${3:, blank=True})",
  name: "XMLField",
  scope: "source.python.django",
  tabTrigger: "xml",
  uuid: "0B31BBE8-B195-4164-B4F6-245803D21C30"},
 {content: 
   "mail.send_mail(\"${1:Subject}\", \"${2:Message}\", \"${3:from@example.com}\", ${4:[\"to@example.com\"]}${5:, fail_silently=True})\n",
  name: "send_mail",
  scope: "source.python.django",
  tabTrigger: "sendmail",
  uuid: "97AF7101-45AD-4286-8AA2-4F43E63EB452"}]