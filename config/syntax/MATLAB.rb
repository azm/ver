# Encoding: UTF-8

{foldingStartMarker: 
  /^\s*(function|if|switch|while|for|try)\b(?!.*\bend\b).*$/,
 foldingStopMarker: /^\s*(end|return)\b.*$/,
 keyEquivalent: "^~M",
 name: "MATLAB",
 patterns: 
  [{begin: 
     /(?x)
(?=function\b) # borrowed from ruby bundle
(?<=^|\s)(function)\s+ # the function keyword
(?>\[(.*)\])?\t# match various different combination of output arguments
((?>[a-zA-Z_]\w*))?
(?>\s*=\s*)?
((?>[a-zA-Z_]\w*(?>[?!]|=(?!>))? )) # the function name
(?=[ \t]*[^\s%|#]) # make sure arguments and not a comment follow
\s*(\() # the opening parenthesis for arguments/,
    beginCaptures: 
     {1 => {name: "storage.type.matlab"},
      2 => {name: "variable.parameter.output.function.matlab"},
      3 => {name: "variable.parameter.output.function.matlab"},
      4 => {name: "entity.name.function.matlab"}},
    contentName: "variable.parameter.input.function.matlab",
    end: "\\)",
    endCaptures: {0 => {name: "punctuation.definition.parameters.matlab"}},
    name: "meta.function.with-arguments.matlab"},
   {captures: 
     {1 => {name: "storage.type.matlab"},
      2 => {name: "variable.parameter.output.function.matlab"},
      3 => {name: "variable.parameter.output.function.matlab"},
      4 => {name: "entity.name.function.matlab"}},
    match: 
     /(?x)
(?=function\b) # borrowed from ruby bundle
(?<=^|\s)(function)\s+ # the function keyword
(?>\[(.*)\])? # match various different combination of output arguments
((?>[a-zA-Z_]\w*))?
(?>\s*=\s*)?
((?>[a-zA-Z_]\w*(?>[?!]|=(?!>))? )) # the function name/,
    name: "meta.function.without-arguments.matlab"},
   {include: "#constants_override"},
   {include: "#brackets"},
   {include: "#curlybrackets"},
   {include: "#parens"},
   {include: "#string"},
   {include: "#transpose"},
   {include: "#double_quote"},
   {include: "#operators"},
   {include: "#all_matlab_keywords"},
   {include: "#all_matlab_comments"},
   {include: "#number"},
   {include: "#variable"},
   {include: "#variable_invalid"},
   {include: "#not_equal_invalid"},
   {include: "#variable_assignment"}],
 repository: 
  {all_matlab_comments: 
    {patterns: 
      [{captures: {1 => {name: "punctuation.definition.comment.matlab"}},
        match: /(%%).*$\n?/,
        name: "comment.double.percentage.matlab"},
       {begin: /%\{/,
        captures: {1 => {name: "punctuation.definition.comment.matlab"}},
        end: "%\\}\\s*\\n",
        name: "comment.block.percentage.matlab"},
       {captures: {1 => {name: "punctuation.definition.comment.matlab"}},
        match: /(%).*$\n?/,
        name: "comment.line.percentage.matlab"}]},
   all_matlab_keywords: 
    {patterns: 
      [{include: "#matlab_keyword_control"},
       {include: "#matlab_keyword_operator"},
       {include: "#matlab_keyword_other"},
       {include: "#matlab_storage_type"},
       {include: "#matlab_storage_modifier"},
       {include: "#matlab_constant_language"},
       {include: "#matlab_variable_function"},
       {include: "#matlab_keyword_desktop"},
       {include: "#matlab_keyword_mathematics"},
       {include: "#matlab_keyword_analysis"},
       {include: "#matlab_storage_control"},
       {include: "#matlab_support_graphics"},
       {include: "#matlab_support_function"},
       {include: "#matlab_support_external"},
       {include: "#matlab_support_toolbox_aerospace"},
       {include: "#matlab_support_toolbox_bioinformatics"},
       {include: "#matlab_support_toolbox_communications"},
       {include: "#matlab_support_toolbox_control_systems"},
       {include: "#matlab_support_toolbox_curve_fitting"},
       {include: "#matlab_support_toolbox_data_acquisition"},
       {include: "#matlab_support_toolbox_database"},
       {include: "#matlab_support_toolbox_datafeed"},
       {include: "#matlab_support_toolbox_design"},
       {include: "#matlab_support_toolbox_excel_link"},
       {include: "#matlab_support_toolbox_filder_design_hdl_coder"},
       {include: "#matlab_support_toolbox_financial_derivatives"},
       {include: "#matlab_support_toolbox_financial"},
       {include: "#matlab_support_toolbox_fixed_income"},
       {include: "#matlab_support_toolbox_fixed_point"},
       {include: "#matlab_support_toolbox_fuzzy_logic"},
       {include: "#matlab_support_toolbox_garch"},
       {include: "#matlab_support_toolbox_genetic_algorithms"},
       {include: "#matlab_support_toolbox_image_acquisition"},
       {include: "#matlab_support_toolbox_image_processing"},
       {include: "#matlab_support_toolbox_instrument_control"},
       {include: "#matlab_support_toolbox_mapping"},
       {include: "#matlab_support_toolbox_model_predictive_control"},
       {include: "#matlab_support_toolbox_model_based_calibration"},
       {include: "#matlab_support_toolbox_neural_network"},
       {include: "#matlab_support_toolbox_opc"},
       {include: "#matlab_support_toolbox_optimization"},
       {include: "#matlab_support_toolbox_rf"},
       {include: "#matlab_support_toolbox_robust_control"},
       {include: "#matlab_support_toolbox_signal_processing"},
       {include: "#matlab_support_toolbox_spline"},
       {include: "#matlab_support_toolbox_statistics"},
       {include: "#matlab_support_toolbox_symbolic_math"},
       {include: "#matlab_support_toolbox_system_identification"},
       {include: "#matlab_support_toolbox_virtual_reality"},
       {include: "#matlab_support_toolbox_wavelet"}]},
   allofem: 
    {patterns: 
      [{include: "#parens"},
       {include: "#curlybrackets"},
       {include: "#end_in_parens"},
       {include: "#brackets"},
       {include: "#string"},
       {include: "#transpose"},
       {include: "#double_quote"},
       {include: "#all_matlab_keywords"},
       {include: "#all_matlab_comments"},
       {include: "#variable"},
       {include: "#variable_invalid"},
       {include: "#number"},
       {include: "#operators"}]},
   brackets: 
    {begin: /\[/,
     beginCaptures: {0 => {name: "meta.brackets.matlab"}},
     contentName: "meta.brackets.matlab",
     end: "\\]",
     endCaptures: {0 => {name: "meta.brackets.matlab"}},
     patterns: [{include: "#allofem"}]},
   constants_override: 
    {comment: "The user is trying to override MATLAB constants and functions.",
     match: /(^|\;)\s*(i|j|inf|Inf|nan|NaN|eps|end)\s*=[^=]/,
     name: "meta.inappropriate.matlab"},
   curlybrackets: 
    {begin: /\{/,
     beginCaptures: {0 => {name: "meta.brackets.curly.matlab"}},
     contentName: "meta.brackets.curly.matlab",
     end: "\\}",
     endCaptures: {0 => {name: "meta.brackets.curly.matlab"}},
     patterns: [{include: "#allofem"}, {include: "#end_in_parens"}]},
   double_quote: 
    {patterns: [{match: /"/, name: "invalid.illegal.invalid-quote.matlab"}]},
   end_in_parens: 
    {comment: "end as operator symbol",
     match: /\bend\b/,
     name: "keyword.operator.symbols.matlab"},
   escaped_quote: 
    {patterns: [{match: /''/, name: "constant.character.escape.matlab"}]},
   matlab_constant_language: 
    {comment: "MATLAB constants",
     match: 
      /(?<!\.)\b(eps|false|Inf|inf|intmax|intmin|namelengthmax|NaN|nan|on|off|realmax|realmin|true)\b/,
     name: "constant.language.matlab"},
   matlab_keyword_analysis: 
    {comment: "Data Analysis",
     match: 
      /(?<!\.)\b(abs|addevent|addsample|addsampletocollection|addts|angle|conv|conv2|convn|corrcoef|cov|cplxpair|ctranspose|cumtrapz|deconv|del2|delevent|delsample|delsamplefromcollection|detrend|diff|fft|fft2|fftn|fftshift|fftw|filter|filter2|getabstime|getdatasamplesize|getinterpmethod|getqualitydesc|getsampleusingtime|gettimeseriesnames|gettsafteratevent|gettsafterevent|gettsatevent|gettsbeforeatevent|gettsbeforeevent|gettsbetweenevents|gradient|idealfilter|ifft|ifft2|ifftn|ifftshift|iqr|max|mean|median|min|mldivide|mode|mrdivide|removets|resample|setabstime|setinterpmethod|settimeseriesnames|std|synchronize|timeseries|trapz|tscollection|tsdata.event|tsprops|tstool|var)\b/,
     name: "keyword.analysis.matlab"},
   matlab_keyword_control: 
    {comment: "Control keywords",
     match: 
      /(?<!\.)\b(break|case|catch|continue|else|elseif|end|for|if|otherwise|pause|rethrow|return|start|startat|stop|switch|try|wait|while)\b/,
     name: "keyword.control.matlab"},
   matlab_keyword_desktop: 
    {comment: "Desktop Tools and Development",
     match: 
      /(?<!\.)\b(addpath|assignin|builddocsearchdb|cd|checkin|checkout|clc|clear|clipboard|cmopts|commandhistory|commandwindow|computer|copyfile|customverctrl|dbclear|dbcont|dbdown|dbquit|dbstack|dbstatus|dbstep|dbstop|dbtype|dbup|debug|demo|diary|dir|doc|docopt|docsearch|dos|echodemo|edit|exit|fileattrib|filebrowser|finish|format|genpath|getenv|grabcode|help|helpbrowser|helpwin|home|hostid|info|keyboard|license|lookfor|ls|matlab|matlabrc|matlabroot|memory|mkdir|mlint|mlintrpt|more|movefile|notebook|openvar|pack|partialpath|path|path2rc|pathdef|pathsep|pathtool|perl|playshow|prefdir|preferences|profile|profsave|publish|pwd|quit|recycle|rehash|restoredefaultpath|rmdir|rmpath|savepath|setenv|startup|support|system|toolboxdir|type|undocheckout|unix|ver|verctrl|verLessThan|version|web|what|whatsnew|which|winqueryreg|workspace)\b|(^\s*!.*$)/,
     name: "keyword.desktop.matlab"},
   matlab_keyword_mathematics: 
    {comment: "Mathematics",
     match: 
      /(?<!\.)\b(accumarray|acos|acosd|acosh|acot|acotd|acoth|acsc|acscd|acsch|airy|amd|asec|asecd|asech|asin|asind|asinh|atan|atan2|atand|atanh|balance|besselh|besseli|besselj|besselk|bessely|beta|betainc|betaln|bicg|bicgstab|blkdiag|bsxfun|bvp4c|bvpget|bvpinit|bvpset|bvpxtend|cart2pol|cart2sph|cat|cdf2rdf|ceil|cgs|chol|cholinc|cholupdate|circshift|colamd|colperm|compan|complex|cond|condeig|condest|conj|convhull|convhulln|cos|cosd|cosh|cot|cotd|coth|cross|csc|cscd|csch|cumprod|cumsum|dblquad|dde23|ddeget|ddesd|ddeset|decic|det|deval|diag|disp|display|dmperm|dot|eig|eigs|ellipj|ellipke|erf|erfc|erfcinv|erfcx|erfinv|etree|etreeplot|exp|expint|expm|expm1|eye|factor|factorial|find|fix|flipdim|fliplr|flipud|floor|fminbnd|fminsearch|freqspace|full|funm|fzero|gallery|gamma|gammainc|gammaln|gcd|gmres|gplot|griddata|griddata3|griddatan|gsvd|hadamard|hankel|hess|hilb|horzcat|hypot|i|idivide|ilu|imag|ind2sub|Inf|inline|interp1|interp1q|interp2|interp3|interpft|interpn|inv|invhilb|ipermute|j|kron|lcm|ldl|legendre|length|linsolve|linspace|log|log10|log1p|log2|logm|logspace|lscov|lsqnonneg|lsqr|lu|luinc|magic|meshgrid|minres|mkpp|mod|NaN|nchoosek|ndgrid|ndims|nextpow2|nnz|nonzeros|norm|normest|nthroot|null|numel|nzmax|ode113|ode15i|ode15s|ode23|ode23s|ode23t|ode23tb|ode45|odefile|odeget|odeset|odextend|ones|optimget|optimset|ordeig|ordqz|ordschur|orth|pascal|pcg|pchip|pdepe|pdeval|perms|permute|pi|pinv|planerot|pol2cart|poly|polyder|polyeig|polyfit|polyint|polyval|polyvalm|pow2|ppval|primes|prod|psi|qmr|qr|qrdelete|qrinsert|qrupdate|quad|quadl|quadv|qz|rand|randn|randperm|rank|rat|rats|rcond|real|reallog|realpow|realsqrt|rem|repmat|reshape|residue|roots|rosser|rot90|round|rref|rsf2csf|schur|sec|secd|sech|shiftdim|sign|sin|sind|sinh|size|sort|sortrows|spalloc|sparse|spaugment|spconvert|spdiags|speye|spfun|sph2cart|spline|spones|spparms|sprand|sprandn|sprandsym|sprank|spy|sqrt|sqrtm|squeeze|ss2tf|sub2ind|subspace|sum|svd|svds|symamd|symbfact|symmlq|symrcm|tan|tand|tanh|toeplitz|trace|treelayout|treeplot|tril|triplequad|triu|unmkpp|unwrap|vander|vectorize|vertcat|wilkinson|zeros)\b/,
     name: "keyword.mathematics.matlab"},
   matlab_keyword_operator: 
    {comment: "Operator keywords",
     match: 
      /(?<!\.)\b(all|and|any|bitand|bitcmp|bitget|bitmax|bitor|bitset|bitshift|bitxor|eq|ge|gt|isa|isappdata|iscell|iscellstr|ischar|iscom|isdir|isempty|isequal|isequalwithequalnans|isevent|isfield|isfinite|isfloat|isglobal|ishandle|ishold|isinf|isinteger|isinterface|isjava|iskeyword|isletter|islogical|ismac|ismember|ismethod|isnan|isnumeric|isobject|ispc|ispref|isprime|isprop|isreal|isscalar|issorted|isspace|issparse|isstrprop|isstruct|isstudent|isunix|isvarname|isvector|le|lt|mislocked|or|ne|not|setxor|union|unique|xor)\b/,
     name: "keyword.operator.matlab"},
   matlab_keyword_other: 
    {comment: "Other keywords",
     match: 
      /(?<!\.)\b(addOptional|addParamValue|addRequired|addtodate|ans|arrayfun|assert|blanks|builtin|calendar|cell|celldisp|cellfun|cellplot|clock|cputime|createCopy|datatipinfo|date|datenum|datestr|datevec|dbmex|deal|deblank|depdir|depfun|echo|eomday|error|etime|eval|evalc|evalin|exist|feval|fieldnames|findstr|func2str|genvarname|getfield|global|inferiorto|inmem|intersect|intwarning|lasterr|lasterror|lastwarn|loadobj|lower|methods|methodsview|mex|mexext|mfilename|mlock|munlock|nargchk|nargoutchk|now|orderfields|parse|pcode|regexp|regexpi|regexprep|regexptranslate|rmfield|run|saveobj|setdiff|setfield|sprintf|sscanf|strcat|strcmp|strcmpi|strfind|strings|strjust|strmatch|strncmp|strncmpi|strread|strrep|strtok|strtrim|structfun|strvcat|subsasgn|subsindex|subsref|substruct|superiorto|swapbytes|symvar|tic|timer|timerfind|timerfindall|toc|typecast|upper|warning|weekday|who|whos)\b/,
     name: "keyword.other.matlab"},
   matlab_storage_control: 
    {comment: "File I/O",
     match: 
      /(?<!\.)\b(addframe|ascii|audioplayer|audiorecorder|aufinfo|auread|auwrite|avifile|aviinfo|aviread|beep|binary|cdfepoch|cdfinfo|cdfread|cdfwrite|csvread|csvwrite|daqread|dlmread|dlmwrite|exifread|fclose|feof|ferror|fgetl|fgets|filehandle|filemarker|fileparts|filesep|fitsinfo|fitsread|fopen|fprintf|fread|frewind|fscanf|fseek|ftell|ftp|fullfile|fwrite|gunzip|gzip|hdf|hdf5|hdf5info|hdf5read|hdf5write|hdfinfo|hdfread|hdftool|imfinfo|importdata|imread|imwrite|lin2mu|load|memmapfile|mget|mmfileinfo|movie2avi|mput|mu2lin|multibandread|multibandwrite|open|rename|save|sendmail|sound|soundsc|tar|tempdir|tempname|textread|textscan|todatenum|uiimport|untar|unzip|urlread|urlwrite|wavfinfo|wavplay|wavread|wavrecord|wavwrite|winopen|wk1finfo|wk1read|wk1write|xlsfinfo|xlsread|xlswrite|xmlread|xmlwrite|xslt|zip)\b/,
     name: "storage.control.matlab"},
   matlab_storage_modifier: 
    {comment: "Storage modifiers",
     match: 
      /(?<!\.)\b(base2dec|bin2dec|cast|cell2mat|cell2struct|cellstr|char|dec2base|dec2bin|dec2hex|hex2dec|hex2num|int2str|mat2cell|mat2str|num2cell|native2unicode|num2hex|num2str|persistent|str2double|str2func|str2mat|str2num|struct2cell|unicode2native)\b/,
     name: "storage.modifier.matlab"},
   matlab_storage_type: 
    {comment: "Storage types",
     match: 
      /(?<!\.)\b(class|double|function|functions|input|inputname|inputParser|int16|int32|int64|int8|logical|single|struct|uint16|uint32|uint64|uint8)\b/,
     name: "storage.type.matlab"},
   matlab_support_external: 
    {comment: "External Interfaces",
     match: 
      /(?<!\.)\b(actxcontrol|actxcontrollist|actxcontrolselect|actxGetRunningServer|actxserver|addproperty|calllib|callSoapService|createClassFromWsdl|createSoapMessage|ddeadv|ddeexec|ddeinit|ddepoke|ddereq|ddeterm|ddeunadv|deleteproperty|enableservice|eventlisteners|events|Execute|GetCharArray|GetFullMatrix|GetVariable|GetWorkspaceData|import|instrcallback|instrfind|instrfindall|interfaces|invoke|javaaddpath|javaArray|javachk|javaclasspath|javaMethod|javaObject|javarmpath|libfunctions|libfunctionsview|libisloaded|libpointer|libstruct|loadlibrary|MaximizeCommandWindow|MinimizeCommandWindow|move|parseSoapResponse|PutCharArray|PutFullMatrix|PutWorkspaceData|readasync|record|registerevent|release|send|serial|serialbreak|stopasync|unloadlibrary|unregisterallevents|unregisterevent|usejava)\b/,
     name: "support.external.matlab"},
   matlab_support_function: 
    {comment: "Creating Graphical User Interfaces",
     match: 
      /(?<!\.)\b(addpref|align|dialog|errordlg|export2wsdlg|getappdata|getpixelposition|getpref|ginput|guidata|guide|guihandles|helpdlg|inputdlg|inspect|listdlg|listfonts|menu|movegui|msgbox|openfig|printdlg|printpreview|questdlg|rmappdata|rmpref|selectmoveresize|setappdata|setpixelposition|setpref|textwrap|uibuttongroup|uicontextmenu|uicontrol|uigetdir|uigetfile|uigetpref|uimenu|uiopen|uipanel|uipushtool|uiputfile|uiresume|uisave|uisetcolor|uisetfont|uisetpref|uistack|uitoggletool|uitoolbar|uiwait|waitbar|waitfor|waitforbuttonpress|warndlg)\b/,
     name: "support.function.matlab"},
   matlab_support_graphics: 
    {comment: "Graphics",
     match: 
      /(?<!\.)\b(alim|allchild|alpha|alphamap|ancestor|annotation|area|axes|axis|bar|bar3|bar3h|barh|box|brighten|camdolly|cameratoolbar|camlight|camlookat|camorbit|campan|campos|camproj|camroll|camtarget|camup|camva|camzoom|caxis|cla|clabel|clf|close|closereq|colorbar|colordef|colormap|colormapeditor|ColorSpec|comet|comet3|compass|coneplot|contour|contour3|contourc|contourf|contourslice|contrast|copyobj|curl|cylinder|daspect|datacursormode|datetick|delaunay|delaunay3|delaunayn|delete|diffuse|divergence|dragrect|drawnow|dsearch|dsearchn|ellipsoid|errorbar|ezcontour|ezcontourf|ezmesh|ezmeshc|ezplot|ezplot3|ezpolar|ezsurf|ezsurfc|feather|figure|figurepalette|fill|fill3|findall|findfigs|findobj|flow|fplot|frame2im|frameedit|gca|gcbf|gcbo|gcf|gco|get|getframe|graymon|grid|gtext|hgexport|hggroup|hgload|hgsave|hgtransform|hidden|hist|histc|hold|hsv2rgb|im2frame|im2java|image|imagesc|imformats|ind2rgb|inpolygon|interpstreamspeed|isocaps|isocolors|isonormals|isosurface|legend|light|lightangle|lighting|line|LineSpec|linkaxes|linkprop|loglog|makehgtform|material|mesh|meshc|meshz|movie|newplot|noanimate|opengl|orient|pan|pareto|patch|pbaspect|pcolor|peaks|pie|pie3|plot|plot3|plotbrowser|plotedit|plotmatrix|plottools|plotyy|polar|polyarea|print|printopt|propedit|propertyeditor|quiver|quiver3|rbbox|rectangle|rectint|reducepatch|reducevolume|refresh|refreshdata|reset|rgb2hsv|rgbplot|ribbon|rose|rotate|rotate3d|saveas|scatter|scatter3|semilogx|semilogy|set|shading|showplottool|shrinkfaces|slice|smooth3|specular|sphere|spinmap|stairs|stem|stem3|stream2|stream3|streamline|streamparticles|streamribbon|streamslice|streamtube|subplot|subvolume|surf|surf2patch|surface|surfc|surfl|surfnorm|tetramesh|texlabel|text|title|trimesh|triplot|trisurf|tsearch|tsearchn|view|viewmtx|volumebounds|voronoi|voronoin|waterfall|whitebg|xlabel|xlim|ylabel|ylim|zlabel|zlim|zoom)\b/,
     name: "support.graphics.matlab"},
   matlab_support_toolbox_aerospace: 
    {comment: "Matlab aerospace toolbox",
     match: 
      /(?<!\.)\b(wrldmagm|updateNodes|updateCamera|updateBodies|update|show|saveas|rrtheta|rrsigma|rrdelta|removeViewpoint|removeNode|removeBody|read|quatrotate|quatnormalize|quatnorm|quatmultiply|quatmod|quatinv|quatdivide|quatconj|quat2dcm|quat2angle|play|nodeInfo|moveBody|move|mjuliandate|machnumber|load|lla2ecef|leapyear|juliandate|initialize|initIfNeeded|hide|gravitywgs84|geoidegm96|geod2geoc|geocradius|geoc2geod|generatePatches|findstartstoptimes|fganimation|ecef2lla|dpressure|delete|decyear|dcmecef2ned|dcmbody2wind|dcm2quat|dcm2latlon|dcm2angle|dcm2alphabeta|datcomimport|createBody|correctairspeed|convvel|convtemp|convpres|convmass|convlength|convforce|convdensity|convangvel|convangacc|convang|convacc|atmospalt|atmosnrlmsise00|atmosnonstd|atmoslapse|atmosisa|atmoscoesa|atmoscira|angle2quat|angle2dcm|alphabeta|airspeed|addViewpoint|addRoute|addNode|addBody|VirtualRealityAnimation|Viewpoint|Node|Geometry|GenerateRunScript|Camera|Body|Animation)\b/,
     name: "support.toolbox.aerospace.matlab"},
   matlab_support_toolbox_bioinformatics: 
    {comment: "Matlab bioinformatics toolbox",
     match: 
      /(?<!\.)\b(zonebackadj|weights|view|traverse|traceplot|topoorder|swalign|svmtrain|svmsmoset|svmclassify|subtree|sptread|showhmmprof|showalignment|shortestpath|seqwordcount|seqtool|seqshowwords|seqshoworfs|seqreverse|seqrcomplement|seqprofile|seqpdist|seqneighjoin|seqmatch|seqlogo|seqlinkage|seqinsertgaps|seqdotplot|seqdisp|seqconsensus|seqcomplement|seq2regexp|select|scfread|samplealign|rnaplot|rnafold|rnaconvert|rna2dna|rmasummary|rmabackadj|revgeneticcode|restrict|reroot|reorder|redgreencmap|rebasecuts|rankfeatures|randseq|randfeatures|ramachandran|quantilenorm|prune|proteinpropplot|proteinplot|profalign|probesetvalues|probesetplot|probesetlookup|probesetlink|probelibraryinfo|plot|phytreewrite|phytreetool|phytreeread|phytree|pfamhmmread|pdist|pdbwrite|pdbread|pdbdistplot|pam|palindromes|optimalleaforder|oligoprop|nwalign|num2goid|nuc44|ntdensity|nt2int|nt2aa|nmercount|mzxmlread|mzxml2peaks|multialignviewer|multialignread|multialign|msviewer|mssgolay|msresample|msppresample|mspeaks|mspalign|msnorm|mslowess|msheatmap|msdotplot|msbackadj|msalign|molweight|molviewer|minspantree|maxflow|mavolcanoplot|mattest|mapcaplot|manorm|malowess|maloglog|mairplot|mainvarsetnorm|maimage|magetfield|mafdr|maboxplot|knnimpute|knnclassify|joinseq|jcampread|isspantree|isomorphism|isoelectric|isdag|int2nt|int2aa|imageneread|hmmprofstruct|hmmprofmerge|hmmprofgenerate|hmmprofestimate|hmmprofalign|graphtraverse|graphtopoorder|graphshortestpath|graphpred2path|graphminspantree|graphmaxflow|graphisspantree|graphisomorphism|graphisdag|graphconncomp|graphcluster|graphallshortestpaths|gprread|gonnet|goannotread|getrelatives|getpdb|getnodesbyid|getnewickstr|getmatrix|gethmmtree|gethmmprof|gethmmalignment|getgeodata|getgenpept|getgenbank|getembl|getedgesbynodeid|getdescendants|getcanonical|getbyname|getblast|getancestors|get|geosoftread|genpeptread|genevarfilter|geneticcode|generangefilter|geneont|genelowvalfilter|geneentropyfilter|genbankread|gcrmabackadj|gcrma|galread|featuresparse|featuresmap|fastawrite|fastaread|exprprofvar|exprprofrange|evalrasmolscript|emblread|dolayout|dndsml|dnds|dna2rna|dimercount|dayhoff|cytobandread|crossvalind|cpgisland|conncomp|codoncount|codonbias|clustergram|cleave|classperf|chromosomeplot|cghcbs|celintensityread|blosum|blastreadlocal|blastread|blastncbi|blastlocal|blastformat|biograph|baselookup|basecount|atomiccomp|aminolookup|allshortestpaths|agferead|affyread|affyprobeseqread|affyprobeaffinities|affyinvarsetnorm|aacount|aa2nt|aa2int)\b/,
     name: "support.toolbox.bioinformatics.matlab"},
   matlab_support_toolbox_communications: 
    {comment: "Matlab communications toolbox",
     match: 
      /(?<!\.)\b(wgn|vitdec|vec2mat|varlms|syndtable|symerr|stdchan|ssbmod|ssbdemod|signlms|shift2mask|seqgen\.pn|seqgen|semianalytic|scatterplot|rsgenpoly|rsencof|rsenc|rsdecof|rsdec|rls|ricianchan|reset|rectpulse|rcosine|rcosiir|rcosflt|rcosfir|rayleighchan|randsrc|randintrlv|randint|randerr|randdeintrlv|quantiz|qfuncinv|qfunc|qammod|qamdemod|pskmod|pskdemod|primpoly|poly2trellis|pmmod|pmdemod|plot|pammod|pamdemod|oqpskmod|oqpskdemod|oct2dec|normlms|noisebw|muxintrlv|muxdeintrlv|mskmod|mskdemod|modnorm|modem\.qammod|modem\.qamdemod|modem\.pskmod|modem\.pskdemod|modem\.pammod|modem\.pamdemod|modem\.oqpskmod|modem\.oqpskdemod|modem\.mskmod|modem\.mskdemod|modem\.genqammod|modem\.genqamdemod|modem\.dpskmod|modem\.dpskdemod|modem|mlseeq|mldivide|minpol|matintrlv|matdeintrlv|mask2shift|marcumq|log|lms|lloyds|lineareq|istrellis|isprimitive|iscatastrophic|intrlv|intdump|ifft|huffmanenco|huffmandict|huffmandeco|hilbiir|helscanintrlv|helscandeintrlv|helintrlv|heldeintrlv|hank2sys|hammgen|gray2bin|gfweight|gftuple|gftrunc|gftable|gfsub|gfroots|gfrepcov|gfrank|gfprimfd|gfprimdf|gfprimck|gfpretty|gfmul|gfminpol|gflineq|gffilter|gfdiv|gfdeconv|gfcosets|gfconv|gfadd|gf|genqammod|genqamdemod|gen2par|fskmod|fskdemod|fmmod|fmdemod|finddelay|filter|fft|fec\.ldpcenc|fec\.ldpcdec|eyediagram|equalize|encode|dvbs2ldpc|dpskmod|dpskdemod|dpcmopt|dpcmenco|dpcmdeco|doppler\.rounded|doppler\.rjakes|doppler\.jakes|doppler\.gaussian|doppler\.flat|doppler\.bigaussian|doppler\.ajakes|doppler|distspec|dftmtx|dfe|deintrlv|decode|de2bi|cyclpoly|cyclgen|cosets|convmtx|convintrlv|convenc|convdeintrlv|compand|commscope\.eyediagram|commscope|cma|bsc|biterr|bin2gray|bi2de|bertool|bersync|berfit|berfading|berconfint|bercoding|berawgn|bchnumerr|bchgenpoly|bchenc|bchdec|awgn|arithenco|arithdeco|ammod|amdemod|alignsignals|algintrlv|algdeintrlv)\b/,
     name: "support.toolbox.communications.matlab"},
   matlab_support_toolbox_control_systems: 
    {comment: "Matlab control systems toolbox",
     match: 
      /(?<!\.)\b(zpkdata|zpk|zgrid|zero|totaldelay|tfdata|tf|stepplot|stepinfo|step|stack|stabsep|ssdata|ssbal|ss2ss|ss|sminreal|size|sisotool|sisoinit|sigmaplot|sigma|sgrid|setoptions|setdelaymodel|set|series|rss|rlocusplot|rlocus|reshape|reg|real|pzplot|pzmap|pole|place|parallel|pade|ord2|obsvf|obsv|nyquistplot|nyquist|norm|nicholsplot|nichols|ngrid|ndims|modsep|modred|minreal|margin|lyapchol|lyap|ltiview|ltiprops|ltimodels|lsimplot|lsiminfo|lsim|lqry|lqrd|lqr|lqgreg|lqg|lft|kalmd|kalman|issiso|isproper|isempty|isdt|isct|iopzplot|iopzmap|inv|interp|initialplot|initial|impulseplot|impulse|imag|hsvplot|hsvd|hasdelay|gram|getoptions|getdelaymodel|get|gensig|gdare|gcare|fselect|freqresp|frdata|frd|fnorm|filt|feedback|fcat|evalfr|estim|esort|dssdata|dss|dsort|drss|dlyapchol|dlyap|dlqr|delayss|delay2z|dcgain|dare|damp|d2d|d2c|ctrlpref|ctrbf|ctrb|covar|connect|conj|chgunits|care|canon|c2d|bodeplot|bodemag|bode|bandwidth|balred|balreal|augstate|append|allmargin|acker|abs)\b/,
     name: "support.toolbox.control-systems.matlab"},
   matlab_support_toolbox_curve_fitting: 
    {comment: "Matlab curve fitting toolbox",
     match: 
      /(?<!\.)\b(type|smooth|set|probvalues|probnames|predint|plot|numcoeffs|numargs|islinear|integrate|indepnames|get|formula|fittype|fitoptions|fit|feval|excludedata|differentiate|dependnames|datastats|confint|coeffvalues|coeffnames|cftool|cflibhelp|cfit|category|argnames)\b/,
     name: "support.toolbox.curve-fitting.matlab"},
   matlab_support_toolbox_data_acquisition: 
    {comment: "Matlab data acquisition toolbox",
     match: 
      /(?<!\.)\b(wait|trigger|stop|start|softscope|size|showdaqevents|setverify|set|save|putvalue|putsample|putdata|propinfo|peekdata|obj2mfile|muxchanidx|makenames|load|length|isvalid|issending|isrunning|islogging|isdioline|ischannel|inspect|getvalue|getsample|getdata|get|flushdata|disp|digitalio|delete|dec2binvec|daqreset|daqregister|daqread|daqmem|daqhwinfo|daqhelp|daqfind|daqcallback|clear|binvec2dec|analogoutput|analoginput|addmuxchannel|addline|addchannel)\b/,
     name: "support.toolbox.data-acquisition.matlab"},
   matlab_support_toolbox_database: 
    {comment: "Matlab database toolbox",
     match: 
      /(?<!\.)\b(width|versioncolumns|update|unregister|tables|tableprivileges|supports|sql2native|setdbprefs|set|runstoredprocedure|rsmd|rows|rollback|resultset|register|querytimeout|querybuilder|procedures|procedurecolumns|primarykeys|ping|namecolumn|logintimeout|isurl|isreadonly|isnullcolumn|isjdbc|isdriver|isconnection|insert|indexinfo|importedkeys|getdatasources|get|fetchmulti|fetch|fastinsert|exportedkeys|exec|drivermanager|driver|dmd|database\.fetch|database|cursor\.fetch|crossreference|confds|commit|columns|columnprivileges|columnnames|cols|close|clearwarnings|bestrowid|attr)\b/,
     name: "support.toolbox.database.matlab"},
   matlab_support_toolbox_datafeed: 
    {comment: "Matlab datafeed toolbox",
     match: 
      /(?<!\.)\b(yahoo|tables|stop|stockticker|showtrades|reuters|pricevol|nextinfo|kx|isconnection|insert|info|idc|hyperfeed|havertool|haver|get|fred|fetch|factset|exec|datastream|close|bloomberg)\b/,
     name: "support.toolbox.datafeed.matlab"},
   matlab_support_toolbox_design: 
    {comment: "Matlab design toolbox",
     match: 
      /(?<!\.)\b(zplane|zpkshiftc|zpkshift|zpkrateup|zpklp2xn|zpklp2xc|zpklp2mbc|zpklp2mb|zpklp2lp|zpklp2hp|zpklp2bsc|zpklp2bs|zpklp2bpc|zpklp2bp|zpkftransf|zpkbpc2bpc|zerophase|window|validstructures|tf2cl|tf2ca|stepz|specifyall|sos|setspecs|set2int|scaleopts|scalecheck|scale|reset|reorder|reffilter|realizemdl|qreport|polyphase|phasez|phasedelay|parallel|order|nstates|normalizefreq|normalize|norm|noisepsdopts|noisepsd|multistage|msesim|msepred|mfilt\.linearinterp|mfilt\.iirwdfinterp|mfilt\.iirwdfdecim|mfilt\.iirinterp|mfilt\.iirdecim|mfilt\.holdinterp|mfilt\.firtdecim|mfilt\.firsrc|mfilt\.firinterp|mfilt\.firfracinterp|mfilt\.firfracdecim|mfilt\.firdecim|mfilt\.fftfirinterp|mfilt\.farrowsrc|mfilt\.cicinterp|mfilt\.cicdecim|mfilt\.cascade|mfilt|measure|maxstep|limitcycle|lagrange|kaiserwin|isstable|issos|isreal|isminphase|ismaxphase|islinphase|isfir|isallpass|int|info|impz|iirshiftc|iirshift|iirrateup|iirpowcomp|iirpeak|iirnotch|iirls|iirlpnormc|iirlpnorm|iirlp2xn|iirlp2xc|iirlp2mbc|iirlp2mb|iirlp2lp|iirlp2hp|iirlp2bsc|iirlp2bs|iirlp2bpc|iirlp2bp|iirlinphase|iirgrpdelay|iirftransf|iircomb|iirbpc2bpc|ifir|help|grpdelay|gain|freqz|freqsamp|freqrespopts|freqrespest|firtype|firpr2chfb|firnyquist|firminphase|firls|firlpnorm|firlp2lp|firlp2hp|firhalfband|firgr|fireqint|firceqrip|fircband|filtstates\.cic|filterbuilder|filter|fftcoeffs|fdesign\.rsrc|fdesign\.peak|fdesign\.parameq|fdesign\.octave|fdesign\.nyquist|fdesign\.notch|fdesign\.lowpass|fdesign\.isinclp|fdesign\.interpolator|fdesign\.hilbert|fdesign\.highpass|fdesign\.halfband|fdesign\.fracdelay|fdesign\.differentiator|fdesign\.decimator|fdesign\.ciccomp|fdesign\.bandstop|fdesign\.bandpass|fdesign\.arbmagnphase|fdesign\.arbmag|fdesign|fdatool|fcfwrite|farrow|euclidfactors|equiripple|ellip|double|disp|dfilt\.wdfallpass|dfilt\.scalar|dfilt\.parallel|dfilt\.latticemamin|dfilt\.latticemamax|dfilt\.latticearma|dfilt\.latticear|dfilt\.latticeallpass|dfilt\.dfsymfir|dfilt\.dffirt|dfilt\.dffir|dfilt\.dfasymfir|dfilt\.df2tsos|dfilt\.df2t|dfilt\.df2sos|dfilt\.df2|dfilt\.df1tsos|dfilt\.df1t|dfilt\.df1sos|dfilt\.df1|dfilt\.cascadewdfallpass|dfilt\.cascadeallpass|dfilt\.cascade|dfilt\.calatticepc|dfilt\.calattice|dfilt\.allpass|dfilt|designopts|designmethods|design|denormalize|cumsec|cost|convert|coewrite|coeread|coeffs|cl2tf|cheby2|cheby1|ca2tf|butter|block|autoscale|allpassshiftc|allpassshift|allpassrateup|allpasslp2xn|allpasslp2xc|allpasslp2mbc|allpasslp2mb|allpasslp2lp|allpasslp2hp|allpasslp2bsc|allpasslp2bs|allpasslp2bpc|allpasslp2bp|allpassbpc2bpc|adaptfilt\.ufdaf|adaptfilt\.tdafdft|adaptfilt\.tdafdct|adaptfilt\.swrls|adaptfilt\.swftf|adaptfilt\.ss|adaptfilt\.se|adaptfilt\.sd|adaptfilt\.rls|adaptfilt\.qrdrls|adaptfilt\.qrdlsl|adaptfilt\.pbufdaf|adaptfilt\.pbfdaf|adaptfilt\.nlms|adaptfilt\.lsl|adaptfilt\.lms|adaptfilt\.hswrls|adaptfilt\.hrls|adaptfilt\.gal|adaptfilt\.ftf|adaptfilt\.filtxlms|adaptfilt\.fdaf|adaptfilt\.dlms|adaptfilt\.blmsfft|adaptfilt\.blms|adaptfilt\.bap|adaptfilt\.apru|adaptfilt\.ap|adaptfilt\.adjlms|adaptfilt)\b/,
     name: "support.toolbox.design.matlab"},
   matlab_support_toolbox_excel_link: 
    {comment: "Matlab excel link toolbox",
     match: 
      /(?<!\.)\b(matlabsub|matlabinit|matlabfcn|MLUseFullDesktop|MLUseCellArray|MLStartDir|MLShowMatlabErrors|MLPutVar|MLPutMatrix|MLOpen|MLMissingDataAsNaN|MLGetVar|MLGetMatrix|MLGetFigure|MLEvalString|MLDeleteMatrix|MLClose|MLAutoStart|MLAppendMatrix)\b/,
     name: "support.toolbox.excel-link.matlab"},
   matlab_support_toolbox_filder_design_hdl_coder: 
    {comment: "Matlab filder design hdl coder toolbox",
     match: /(?<!\.)\b(generatetbstimulus|generatetb|generatehdl|fdhdltool)\b/,
     name: "support.toolbox.filder-design-hdl-coder.matlab"},
   matlab_support_toolbox_financial: 
    {comment: "Matlab financial toolbox",
     match: 
      /(?<!\.)\b(zero2pyld|zero2fwd|zero2disc|zbtyield|zbtprice|yldtbill|yldmat|ylddisc|yearfrac|yeardays|year|xirr|x2mdate|wrkdydif|willpctr|willad|weights2holdings|weekday|wclose|volroc|vertcat|uplus|uminus|uicalendar|ugarchsim|ugarchpred|ugarchllf|ugarch|typprice|tsmovavg|tsmom|tsaccel|tr2bonds|toweekly|totalreturnprice|tosemi|toquoted|toquarterly|tomonthly|todecimal|today|todaily|toannual|times|time2date|tick2ret|thirtytwo2dec|thirdwednesday|tbl2bond|taxedrr|targetreturn|subsref|subsasgn|stochosc|std|spctkd|sortfts|smoothts|size|sharpe|setfield|selectreturn|second|rsindex|rmfield|ret2tick|resamplets|rdivide|pyld2zero|pvvar|pvtrend|pvfix|prtbill|prmat|prdisc|prcroc|prbyzero|power|posvolidx|portvrisk|portstats|portsim|portrand|portopt|portcons|portalpha|portalloc|pointfig|plus|plot|periodicreturns|peravg|pcpval|pcglims|pcgcomp|pcalims|payuni|payper|payodd|payadv|opprofit|onbalvol|nweekdate|now|nomrr|negvolidx|mvnrstd|mvnrobj|mvnrmle|mvnrfish|mtimes|mrdivide|movavg|months|month|mirr|minute|minus|min|merge|medprice|mean|maxdrawdown|max|macd|m2xdate|lweekdate|lpm|log2|log10|log|llow|length|leadts|lbusdate|lagts|issorted|isfield|isequal|iscompatible|isbusday|irr|inforatio|hour|horzcat|holidays|holdings2weights|hist|highlow|hhigh|getnameidx|getfield|geom2arith|fwd2zero|fvvar|fvfix|fvdisc|ftsuniq|ftstool|ftsinfo|ftsgui|ftsbound|fts2mat|fts2ascii|frontier|frontcon|freqstr|freqnum|frac2cur|fpctkd|fints|filter|fillts|fieldnames|fetch|fbusdate|extfield|exp|ewstats|eomday|eomdate|end|emaxdrawdown|elpm|effrr|ecmnstd|ecmnobj|ecmnmle|ecmninit|ecmnhess|ecmnfish|ecmmvnrstd|ecmmvnrobj|ecmmvnrmle|ecmmvnrfish|ecmlsrobj|ecmlsrmle|discrate|disc2zero|diff|depstln|depsoyd|deprdv|depgendb|depfixdb|dec2thirtytwo|daysdif|daysadd|daysact|days365|days360psa|days360isda|days360e|days360|day|datewrkdy|datevec|datestr|datenum|datemnth|datefind|datedisp|dateaxis|date2time|cur2str|cur2frac|cumsum|createholidays|cpnpersz|cpndaysp|cpndaysn|cpndatepq|cpndatep|cpndatenq|cpndaten|cpncount|cov2corr|corr2cov|convertto|convert2sur|chfield|chartfts|chaikvolat|chaikosc|cftimes|cfport|cfdur|cfdates|cfconv|cfamounts|candle|busdays|busdate|boxcox|bollinger|bolling|bndyield|bndspread|bndprice|bnddury|bnddurp|bndconvy|bndconvp|blsvega|blstheta|blsrho|blsprice|blslambda|blsimpv|blsgamma|blsdelta|blkprice|blkimpv|binprice|beytbill|barh|bar3h|bar3|bar|ascii2fts|arith2geom|annuterm|annurate|amortize|adosc|adline|active2abs|acrudisc|acrubond|accrfrac|abs2active)\b/,
     name: "support.toolbox.financial.matlab"},
   matlab_support_toolbox_financial_derivatives: 
    {comment: "Matlab financial derivatives toolbox",
     match: 
      /(?<!\.)\b(trintreeshape|trintreepath|treeviewer|treeshape|treepath|time2date|swaptionbyhw|swaptionbyhjm|swaptionbybk|swaptionbybdt|swapbyzero|swapbyhw|swapbyhjm|swapbybk|swapbybdt|stockspec|stockoptspec|ratetimes|rate2disc|optstockbyitt|optstockbyeqp|optstockbycrr|optbndbyhw|optbndbyhjm|optbndbybk|optbndbybdt|mmktbyhjm|mmktbybdt|mktrintree|mktree|mkbush|lookbackbyitt|lookbackbyeqp|lookbackbycrr|itttree|itttimespec|ittsens|ittprice|isafin|intenvset|intenvsens|intenvprice|intenvget|insttypes|instswaption|instswap|instsetfield|instselect|instoptstock|instoptbnd|instlookback|instlength|instgetcell|instget|instfloor|instfloat|instfixed|instfind|instfields|instdisp|instdelete|instcompound|instcf|instcap|instbond|instbarrier|instasian|instaddfield|instadd|hwvolspec|hwtree|hwtimespec|hwsens|hwprice|hjmvolspec|hjmtree|hjmtimespec|hjmsens|hjmprice|hedgeslf|hedgeopt|floorbyhw|floorbyhjm|floorbybk|floorbybdt|floatbyzero|floatbyhw|floatbyhjm|floatbybk|floatbybdt|fixedbyzero|fixedbyhw|fixedbyhjm|fixedbybk|fixedbybdt|eqptree|eqptimespec|eqpsens|eqpprice|disc2rate|derivset|derivget|datedisp|date2time|cvtree|crrtree|crrtimespec|crrsens|crrprice|compoundbyitt|compoundbyeqp|compoundbycrr|classfin|cfbyzero|cfbyhw|cfbyhjm|cfbybk|cfbybdt|capbyhw|capbyhjm|capbybk|capbybdt|bushshape|bushpath|bondbyzero|bondbyhw|bondbyhjm|bondbybk|bondbybdt|bkvolspec|bktree|bktimespec|bksens|bkprice|bdtvolspec|bdttree|bdttimespec|bdtsens|bdtprice|barrierbyitt|barrierbyeqp|barrierbycrr|asianbyitt|asianbyeqp|asianbycrr)\b/,
     name: "support.toolbox.financial-derivatives.matlab"},
   matlab_support_toolbox_fixed_income: 
    {comment: "Matlab fixed income toolbox",
     match: 
      /(?<!\.)\b(zeroyield|zeroprice|tfutyieldbyrepo|tfutpricebyrepo|tfutimprepo|tfutbyyield|tfutbyprice|tbillyield2disc|tbillyield|tbillval01|tbillrepo|tbillprice|tbilldisc2yield|stepcpnyield|stepcpnprice|stepcpncfamounts|psaspeed2rate|psaspeed2default|mbsyield2speed|mbsyield2oas|mbsyield|mbswal|mbsprice2speed|mbsprice2oas|mbsprice|mbspassthrough|mbsoas2yield|mbsoas2price|mbsnoprepay|mbsdury|mbsdurp|mbsconvy|mbsconvp|mbscfamounts|liborprice|liborfloat2fixed|liborduration|convfactor|cfamounts|cdyield|cdprice|cdai|cbprice|bkput|bkfloorlet|bkcaplet|bkcall)\b/,
     name: "support.toolbox.fixed-income.matlab"},
   matlab_support_toolbox_fixed_point: 
    {comment: "Matlab fixed-point toolbox",
     match: 
      /(?<!\.)\b(zlim|ylim|xlim|wordlength|waterfall|voronoin|voronoi|vertcat|upperbound|uplus|uminus|uint8|uint32|uint16|triu|trisurf|triplot|trimesh|tril|treeplot|transpose|tostring|toeplitz|times|text|surfnorm|surfl|surfc|surf|sum|subsref|subsasgn|sub|stripscaling|streamtube|streamslice|streamribbon|stem3|stem|stairs|squeeze|sqrt|spy|slice|size|single|sign|shiftdim|set|semilogy|semilogx|sdec|scatter3|scatter|savefipref|round|rose|ribbon|rgbplot|reshape|resetlog|reset|rescale|repmat|realmin|realmax|real|range|randquant|quiver3|quiver|quantizer|quantize|pow2|polar|plus|plotyy|plotmatrix|plot3|plot|permute|pcolor|patch|or|oct|nunderflows|numerictype|numberofelements|num2int|num2hex|num2bin|noverflows|not|noperations|ne|ndims|mtimes|mpy|minus|minlog|min|meshz|meshc|mesh|maxlog|max|lt|lsb|lowerbound|loglog|logical|line|length|le|isvector|issigned|isscalar|isrow|isreal|ispropequal|isobject|isnumerictype|isnumeric|isnan|isinf|isfinite|isfimath|isfi|isequal|isempty|iscolumn|ipermute|intmin|intmax|int8|int32|int16|int|innerprodintbits|imag|horzcat|histc|hist|hex2num|hex|hankel|gt|gplot|getmsb|getlsb|get|ge|fractionlength|fplot|flipud|fliplr|flipdim|fipref|fimath|fi|feather|ezsurfc|ezsurf|ezpolar|ezplot3|ezplot|ezmesh|ezcontourf|ezcontour|exponentmin|exponentmax|exponentlength|exponentbias|etreeplot|errorbar|eq|eps|end|double|divide|disp|diag|denormalmin|denormalmax|dec|ctranspose|copyobj|convergent|contourf|contourc|contour3|contour|conj|coneplot|complex|compass|comet3|comet|clabel|buffer|bitxorreduce|bitxor|bitsrl|bitsra|bitsll|bitsliceget|bitshift|bitset|bitror|bitrol|bitorreduce|bitor|bitget|bitconcat|bitcmp|bitandreduce|bitand|bin2num|bin|barh|bar|area|any|and|all|add|abs)\b/,
     name: "support.toolbox.fixed-point.matlab"},
   matlab_support_toolbox_fuzzy_logic: 
    {comment: "Matlab fuzzy logic toolbox",
     match: 
      /(?<!\.)\b(zmf|writefis|trimf|trapmf|surfview|subclust|smf|sigmf|showrule|showfis|sffis|setfis|ruleview|ruleedit|rmvar|rmmf|readfis|psigmf|probor|plotmf|plotfis|pimf|parsrule|newfis|mfedit|mf2mf|mam2sug|getfis|gensurf|genfis3|genfis2|genfis1|gbellmf|gaussmf|gauss2mf|fuzzy|fuzblock|fuzarith|findcluster|fcm|evalmf|evalfis|dsigmf|defuzz|convertfis|anfisedit|anfis|addvar|addrule|addmf)\b/,
     name: "support.toolbox.fuzzy-logic.matlab"},
   matlab_support_toolbox_garch: 
    {comment: "Matlab GARCH toolbox",
     match: 
      /(?<!\.)\b(ret2price|price2ret|ppTSTest|ppARTest|ppARDTest|parcorr|lratiotest|lbqtest|lagmatrix|hpfilter|garchsim|garchset|garchpred|garchplot|garchma|garchinfer|garchget|garchfit|garchdisp|garchcount|garchar|dfTSTest|dfARTest|dfARDTest|crosscorr|autocorr|archtest|aicbic)\b/,
     name: "support.toolbox.garch.matlab"},
   matlab_support_toolbox_genetic_algorithms: 
    {comment: "Matlab genetic algorithms toolbox",
     match: 
      /(?<!\.)\b(threshacceptbnd|simulannealbnd|saoptimset|saoptimget|psoptimset|psoptimget|psearchtool|patternsearch|gatool|gaoptimset|gaoptimget|gamultiobj|ga)\b/,
     name: "support.toolbox.genetic-algorithms.matlab"},
   matlab_support_toolbox_image_acquisition: 
    {comment: "Matlab image acquisition toolbox",
     match: 
      /(?<!\.)\b(wait|videoinput|triggerinfo|triggerconfig|trigger|stoppreview|stop|start|set|save|propinfo|preview|peekdata|obj2mfile|load|isvalid|isrunning|islogging|imaqtool|imaqreset|imaqmontage|imaqmem|imaqhwinfo|imaqhelp|imaqfind|getsnapshot|getselectedsource|getdata|get|flushdata|disp|delete|closepreview|clear)\b/,
     name: "support.toolbox.image-acquisition.matlab"},
   matlab_support_toolbox_image_processing: 
    {comment: "Matlab image processing toolbox",
     match: 
      /(?<!\.)\b(zoom|ycbcr2rgb|xyz2uint16|xyz2double|wiener2|whitepoint|watershed|warp|uintlut|uint8|uint16|truesize|translate|tonemap|tforminv|tformfwd|tformarray|subimage|stretchlim|strel|stdfilt|std2|roipoly|roifilt2|roifill|roicolor|rgbplot|rgb2ycbcr|rgb2ntsc|rgb2ind|rgb2hsv|rgb2gray|regionprops|reflect|rangefilt|radon|qtsetblk|qtgetblk|qtdecomp|psf2otf|poly2mask|pixval|phantom|para2fan|padarray|otf2psf|ordfilt2|ntsc2rgb|normxcorr2|nlfilter|nitfread|nitfinfo|montage|medfilt2|mean2|mat2gray|maketform|makeresampler|makelut|makecform|makeConstrainToRectFcn|label2rgb|lab2uint8|lab2uint16|lab2double|isrgb|isnitf|isind|isicc|isgray|isflat|isbw|iradon|iptwindowalign|iptsetpref|iptremovecallback|iptnum2ordinal|ipticondir|iptgetpref|iptgetapi|iptdemos|iptcheckstrs|iptchecknargin|iptcheckmap|iptcheckinput|iptcheckhandle|iptcheckconn|iptaddcallback|iptSetPointerBehavior|iptPointerManager|iptGetPointerBehavior|ippl|intlut|interfileread|interfileinfo|ind2rgb|ind2gray|imwrite|imview|imtransform|imtophat|imtool|imsubtract|imshow|imscrollpanel|imsave|imrotate|imresize|imregionalmin|imregionalmax|imrect|imreconstruct|imread|impyramid|imputfile|improfile|impositionrect|impoly|impoint|implay|impixelregionpanel|impixelregion|impixelinfoval|impixelinfo|impixel|imoverviewpanel|imoverview|imopen|imnoise|immultiply|immovie|immagbox|imline|imlincomb|imimposemin|imhmin|imhmax|imhist|imhandles|imgetfile|imgcf|imgca|imfreehand|imfinfo|imfilter|imfill|imextendedmin|imextendedmax|imerode|imellipse|imdivide|imdistline|imdisplayrange|imdilate|imcrop|imcontrast|imcontour|imcomplement|imclose|imclearborder|imbothat|imattributes|imapprox|imagemodel|imageinfo|imadjust|imadd|imabsdiff|im2uint8|im2uint16|im2single|im2java2d|im2java|im2int16|im2double|im2col|im2bw|ifftn|ifft2|ifanbeam|idct2|iccwrite|iccroot|iccread|iccfind|hsv2rgb|houghpeaks|houghlines|hough|histeq|hdrread|graythresh|grayslice|graycoprops|graycomatrix|gray2ind|getsequence|getrect|getrangefromclass|getpts|getnhood|getneighbors|getline|getimagemodel|getimage|getheight|fwind2|fwind1|ftrans2|fspecial|fsamp2|freqz2|freqspace|fliptform|findbounds|filter2|fftshift|fftn|fft2|fanbeam|fan2para|entropyfilt|entropy|edgetaper|edge|double|dither|dicomwrite|dicomuid|dicomread|dicomlookup|dicominfo|dicomdict|dicomanon|demosaic|decorrstretch|deconvwnr|deconvreg|deconvlucy|deconvblind|dctmtx|dct2|cpstruct2pairs|cpselect|cpcorr|cp2tform|corr2|convn|convmtx2|conv2|conndef|colorbar|colfilt|col2im|cmunique|cmpermute|checkerboard|bwunpack|bwulterode|bwtraceboundary|bwselect|bwperim|bwpack|bwmorph|bwlabeln|bwlabel|bwhitmiss|bweuler|bwdist|bwboundaries|bwareaopen|bwarea|brighten|blkproc|bestblk|axes2pix|applylut|applycform|analyze75read|analyze75info|adapthisteq)\b/,
     name: "support.toolbox.image-processing.matlab"},
   matlab_support_toolbox_instrument_control: 
    {comment: "Matlab instrument control toolbox",
     match: 
      /(?<!\.)\b(visa|update|udp|trigger|tmtool|tcpip|stopasync|spoll|size|set|serialbreak|serial|selftest|scanstr|save|resolvehost|remove|record|readasync|query|propinfo|obj2mfile|midtest|midedit|methods|memwrite|memunmap|memread|mempoke|mempeek|memmap|makemid|load|length|iviconfigurationstore|isvalid|invoke|instrreset|instrnotify|instrid|instrhwinfo|instrhelp|instrfindall|instrfind|instrcallback|inspect|icdevice|gpib|geterror|get|fwrite|fscanf|fread|fprintf|fopen|flushoutput|flushinput|fgets|fgetl|fclose|echoudp|echotcpip|disp|disconnect|devicereset|delete|connect|commit|clrdevice|clear|binblockwrite|binblockread|add)\b/,
     name: "support.toolbox.instrument-control.matlab"},
   matlab_support_toolbox_mapping: 
    {comment: "Matlab mapping toolbox",
     match: 
      /(?<!\.)\b(zerom|zero22pi|zdatam-ui|zdatam|wrapToPi|wrapTo360|wrapTo2Pi|wrapTo180|worldmap|worldfilewrite|worldfileread|westof|vmap0ui|vmap0rhead|vmap0read|vmap0data|vinvtran|viewshed|vfwdtran|vec2mtx|utmzoneui|utmzone|utmgeoid|usgsdems|usgsdem|usgs24kdem|usamap|updategeostruct|unwrapMultipart|unitstr|unitsratio|undotrim|undoclip|uimaptbx|trimdata|trimcart|trackui|trackg|track2|track1|track|toRadians|toDegrees|tissot|timezone|timedim|time2str|tightmap|tigerp|tigermif|tgrline|textm|tbase|tagm-ui|tagm|symbolm|surfm|surflsrm|surflm|surfdist|surfacem|str2angle|stem3m|stdm|stdist|spzerom|spcread|smoothlong|sm2rad|sm2nm|sm2km|sm2deg|sizem|showm-ui|showm|showaxes|shapewrite|shaperead|shapeinfo|shaderel|setpostn|setm|setltln|seedm|sectorg|sec2hr|sec2hms|sec2hm|sdtsinfo|sdtsdemread|scxsc|scirclui|scircleg|scircle2|scircle1|scatterm|scaleruler|satbath|rsphere|roundn|rotatetext|rotatem|rootlayr|rhxrh|restack|resizem|removeExtraNanSeparators|refvec2mat|refmat2vec|reducem|reckon|readmtx|readfk5|readfields|rcurve|rad2sm|rad2nm|rad2km|rad2dms|rad2dm|rad2deg|quiverm|quiver3m|qrydata|putpole|projlist|projinv|projfwd|project|previewmap|polyxpoly|polysplit|polymerge|polyjoin|polycut|polybool|poly2fv|poly2cw|poly2ccw|polcmap|plotm|plot3m|plabel|pixcenters|pix2map|pix2latlon|pcolorm|patchm|patchesm|parallelui|paperscale|panzoom|originui|org2pol|onem|npi2pi|northarrow|nm2sm|nm2rad|nm2km|nm2deg|newpole|neworig|navfix|nanm|nanclip|namem|n2ecc|mobjects|mlayers|mlabelzero22pi|mlabel|minvtran|minaxis|mfwdtran|meshm|meshlsrm|meshgrat|meridianfwd|meridianarc|meanm|mdistort|mat2hms|mat2dms|mapview|maptrims|maptrimp|maptriml|maptrim|maptool|mapshow|maps|mapprofile|mapoutline|maplist|mapbbox|map2pix|makesymbolspec|makerefmat|makemapped|makedbfspec|makeattribspec|majaxis|lv2ecef|ltln2val|los2|linem|linecirc|limitm|lightmui|lightm|legs|lcolorbar|latlon2pix|kmlwrite|km2sm|km2rad|km2nm|km2deg|ispolycw|ismapped|ismap|isShapeMultipart|intrplon|intrplat|interpm|inputm|ind2rgb8|imbedm|hr2sec|hr2hms|hr2hm|hms2sec|hms2mat|hms2hr|hms2hm|histr|hista|hidem-ui|hidem|handlem-ui|handlem|gtopo30s|gtopo30|gtextm|gshhs|grn2eqa|gridm|grid2image|grepfields|gradientm|globedems|globedem|getworldfilename|getseeds|getm|geotiffread|geotiffinfo|geotiff2mstruct|geoshow|geoloc2grid|geodetic2geocentricLat|geodetic2ecef|geocentric2geodeticLat|gcxsc|gcxgc|gcwaypts|gcpmap|gcm|gc2sc|fromRadians|fromDegrees|framem|flatearthpoly|flat2ecc|fipsname|findm|filterm|fillm|fill3m|extractm|extractfield|etopo5|etopo|eqa2grn|epsm|encodem|ellipse1|elevation|egm96geoid|ecef2lv|ecef2geodetic|ecc2n|ecc2flat|eastof|dteds|dted|driftvel|driftcorr|dreckon|dms2rad|dms2mat|dms2dm|dms2degrees|dms2deg|dm2degrees|distortcalc|distdim|distance|dist2str|displaym|departure|demdataui|demcmap|degrees2dms|degrees2dm|deg2sm|deg2rad|deg2nm|deg2km|deg2dms|deg2dm|defaultm|dcwrhead|dcwread|dcwgaz|dcwdata|daspectm|crossfix|convertlat|contourm|contourfm|contourcmap|contour3m|cometm|comet3m|combntns|colorui|colorm|cmapui|clrmenu|closePolygonParts|clmo-ui|clmo|clma|clipdata|clegendm|clabelm|circcirc|changem|cart2grn|camupm|camtargm|camposm|bufferm|azimuth|axesscale|axesmui|axesm|axes2ecc|avhrrlambert|avhrrgoode|areaquad|areamat|areaint|arcgridread|antipode|angledim|angl2str|almanac)\b/,
     name: "support.toolbox.mapping.matlab"},
   matlab_support_toolbox_model_based_calibration: 
    {comment: "Matlab model-based calibration toolbox",
     match: 
      /(?<!\.)\b(modelinput|getAlternativeTypes|getAlternativeNames|YData|XDataNames|XData|Widths|Values|Value|UserVariables|UpdateResponseFeatures|UpdateResponse|Units|Type|TestPlans|TestFilters|SummaryStatisticsForTest|SummaryStatistics|StepwiseStatus|StepwiseSelection|StepwiseRegression|Status|StatisticsDialog|SizeOfParameterSet|SingleVIF|SignalUnits|SignalNames|SetupDialog|SetTermStatus|SaveAs|Save|RollbackEdit|RestoreDataForTest|RestoreData|Responses|ResponseSignalName|Response|RemoveVariable|RemoveTestFilter|RemoveOutliersForTest|RemoveOutliers|RemoveFilter|RemoveData|Remove|RecordsPerTest|Properties|PredictedValueForTest|PredictedValue|PartialVIF|Parameters|ParameterStatistics|PEVForTest|PEV|Owner|OutputData|OutlierIndicesForTest|OutlierIndices|NumberOfTests|NumberOfRecords|NumberOfParameters|NumberOfInputs|New|Names|Name|MultipleVIF|ModifyVariable|ModifyTestFilter|ModifyFilter|Modified|ModelSetup|ModelForTest|Model|MakeHierarchicalResponse|LocalResponses|LoadProject|Load|Levels|Level|Jacobian|IsEditable|IsBeingEdited|IsAlternative|InputsPerLevel|Inputs|InputSignalNames|InputSetupDialog|InputData|ImportFromMBCDataStructure|ImportFromFile|GetTermStatus|GetTermLabel|GetIncludedTerms|GetDesignMatrix|GetAllTerms|FitAlgorithm|Fit|Filters|Filename|ExportToMBCDataStructure|Export|Evaluate|DoubleResponseData|DoubleInputData|DiagnosticStatistics|DetachData|DefineTestGroups|DefineNumberOfRecordsPerTest|DefaultModels|DataFileTypes|Data|CreateTestplan|CreateResponseFeature|CreateResponse|CreateProject|CreateModel|CreateData|CreateAlternativeModels|CreateAlgorithm|Covariance|Correlation|CopyData|CommitEdit|ChooseAsBest|Centers|BoxCoxSSE|BeginEdit|AttachData|Append|AlternativeResponses|AlternativeModelStatistics|AliasMatrix|AddVariable|AddTestFilter|AddFilter)\b/,
     name: "support.toolbox.model-based-calibration.matlab"},
   matlab_support_toolbox_model_predictive_control: 
    {comment: "Matlab model predictive control toolbox",
     match: 
      /(?<!\.)\b(zpk|trim|tf|ss|size|sim|setoutdist|setname|setmpcsignals|setmpcdata|setindist|setestim|set|qpdantz|plot|pack|mpcverbosity|mpcstate|mpcsimopt|mpcprops|mpcmove|mpchelp|mpc|getoutdist|getname|getmpcdata|getindist|getestim|get|d2d|compare|cloffset)\b/,
     name: "support.toolbox.model-predictive-control.matlab"},
   matlab_support_toolbox_neural_network: 
    {comment: "Matlab neural network toolbox",
     match: 
      /(?<!\.)\b(vec2ind|tribas|trainscg|trains|trainrp|trainr|trainoss|trainlm|traingdx|traingdm|traingda|traingd|traincgp|traincgf|traincgb|trainc|trainbr|trainbfgc|trainbfg|trainb|train|tansig|sse|srchhyb|srchgol|srchcha|srchbre|srchbac|sp2narx|softmax|sim|setx|seq2con|scalprod|satlins|satlin|revert|removerows|removeconstantrows|randtop|rands|randnr|randnc|radbas|quant|purelin|processpca|postreg|poslin|pnormc|plotvec|plotv|plotsom|plotpv|plotperf|plotpc|plotes|plotep|plotbr|normr|normprod|normc|nntool|nnt2som|nnt2rb|nnt2p|nnt2lvq|nnt2lin|nnt2hop|nnt2ff|nnt2elm|nnt2c|nftool|newsom|newrbe|newrb|newpnn|newp|newnarxsp|newnarx|newlvq|newlrn|newlind|newlin|newhop|newgrnn|newfftd|newff|newelm|newdtdnn|newcf|newc|network|netsum|netprod|netinv|negdist|mseregec|msereg|mse|minmax|midpoint|maxlinlr|mapstd|mapminmax|mandist|mae|logsig|linkdist|learnwh|learnsom|learnpn|learnp|learnos|learnlv2|learnlv1|learnk|learnis|learnhd|learnh|learngdm|learngd|learncon|initzero|initwb|initnw|initlay|initcon|init|ind2vec|hintonwb|hintonw|hextop|hardlims|hardlim|gridtop|getx|gensim|fixunknowns|errsurf|dotprod|dividerand|divideint|divideind|divideblock|dist|display|disp|convwf|concur|con2seq|compet|combvec|calcperf|calcpd|calcjx|calcjejj|calcgx|boxdist|adapt)\b/,
     name: "support.toolbox.neural-network.matlab"},
   matlab_support_toolbox_opc: 
    {comment: "Matlab OPC toolbox",
     match: 
      /(?<!\.)\b(writeasync|write|wait|trend|stop|start|showopcevents|set|serveritems|serveritemprops|save|removepublicgroup|refresh|readasync|read|propinfo|peekdata|openosf|opctool|opcsupport|opcstruct2timeseries|opcstruct2array|opcserverinfo|opcreset|opcregister|opcread|opcqstr|opcqparts|opcqid|opchelp|opcfind|opcda|opccallback|obj2mfile|makepublic|load|isvalid|getnamespace|getdata|get|genslwrite|genslread|flushdata|flatnamespace|disp|disconnect|delete|copyobj|connect|clonegroup|cleareventlog|cancelasync|additem|addgroup)\b/,
     name: "support.toolbox.opc.matlab"},
   matlab_support_toolbox_optimization: 
    {comment: "Matlab optimization toolbox",
     match: 
      /(?<!\.)\b(quadprog|optimtool|optimset|optimget|lsqnonneg|lsqnonlin|lsqlin|lsqcurvefit|linprog|gangstr|fzmult|fzero|fsolve|fseminf|fminunc|fminsearch|fminimax|fmincon|fminbnd|fgoalattain|color|bintprog)\b/,
     name: "support.toolbox.optimization.matlab"},
   matlab_support_toolbox_rf: 
    {comment: "Matlab RF toolbox",
     match: 
      /(?<!\.)\b(writeva|write|timeresp|smith|setop|semilogy|semilogx|rfmodel\.rational|rfdata\.power|rfdata\.noise|rfdata\.nf|rfdata\.network|rfdata\.mixerspur|rfdata\.ip3|rfdata\.data|rfckt\.txline|rfckt\.twowire|rfckt\.shuntrlc|rfckt\.seriesrlc|rfckt\.series|rfckt\.rlcgline|rfckt\.passive|rfckt\.parallelplate|rfckt\.parallel|rfckt\.mixer|rfckt\.microstrip|rfckt\.lclowpasstee|rfckt\.lclowpasspi|rfckt\.lchighpasstee|rfckt\.lchighpasspi|rfckt\.lcbandstoptee|rfckt\.lcbandstoppi|rfckt\.lcbandpasstee|rfckt\.lcbandpasspi|rfckt\.hybridg|rfckt\.hybrid|rfckt\.delay|rfckt\.datafile|rfckt\.cpw|rfckt\.coaxial|rfckt\.cascade|rfckt\.amplifier|restore|read|polar|plotyy|plot|loglog|listparam|listformat|impulse|getz0|getop|freqresp|extract|circle|calculate|analyze)\b/,
     name: "support.toolbox.rf.matlab"},
   matlab_support_toolbox_robust_control: 
    {comment: "Matlab robust control toolbox",
     match: 
      /(?<!\.)\b(wcsens|wcnorm|wcmargin|wcgopt|wcgain|usubs|uss|usimsamp|usiminfo|usimfill|usample|ureal|uplot|umat|ultidyn|ufrd|udyn|ucomplexm|ucomplex|sysic|symdec|stack|stabproj|squeeze|slowfast|skewdec|simplify|showlmi|setmvar|setlmis|sectf|sdlsim|sdhinfsyn|sdhinfnorm|schurmr|robuststab|robustperf|robopt|repmat|reduce|randuss|randumat|randatom|quadstab|quadperf|pvinfo|pvec|psys|psinfo|popov|polydec|pdsimul|pdlstab|normalized2actual|newlmi|ncfsyn|ncfmr|ncfmargin|mussvextract|mussv|msfsyn|modreal|mktito|mkfilter|mixsyn|mincx|matnbr|mat2dec|ltrsyn|ltiarray2uss|loopsyn|loopsens|loopmargin|lmivar|lmiterm|lmireg|lminbr|lmiinfo|lmiedit|lftdata|isuncertain|ispsys|imp2ss|imp2exp|icsignal|iconnect|icomplexify|hinfsyn|hinfgs|hankelsv|hankelmr|h2syn|h2hinfsyn|gridureal|gevp|getlmis|genphase|gapmetric|fitmagfrd|fitfrd|feasp|evallmi|drawmag|dmplot|dksyn|dkitopt|diag|delmvar|dellmi|defcx|decnbr|decinfo|decay|dec2mat|dcgainmr|cpmargin|complexify|cmsclsyn|bstmr|bilin|balancmr|augw|aff2pol|actual2normalized)\b/,
     name: "support.toolbox.robust-control.matlab"},
   matlab_support_toolbox_signal_processing: 
    {comment: "Matlab signal processing toolbox",
     match: 
      /(?<!\.)\b(zplane|zp2tf|zp2ss|zp2sos|zerophase|yulewalk|xcov|xcorr2|xcorr|wvtool|wintool|window|vco|upsample|upfirdn|unwrap|uencode|udecode|tukeywin|tripuls|triang|tfestimate|tf2zpk|tf2zp|tf2ss|tf2sos|tf2latc|taylorwin|strips|stmcb|stepz|ss2zp|ss2tf|ss2sos|square|sptool|spectrum\.yulear|spectrum\.welch|spectrum\.periodogram|spectrum\.music|spectrum\.mtm|spectrum\.mcov|spectrum\.eigenvector|spectrum\.cov|spectrum\.burg|spectrum|spectrogram|sosfilt|sos2zp|sos2tf|sos2ss|sos2cell|sinc|sigwin|sgolayfilt|sgolay|seqperiod|schurrc|sawtooth|rootmusic|rooteig|rlevinson|residuez|resample|rectwin|rectpuls|rceps|rc2poly|rc2lar|rc2is|rc2ac|pyulear|pwelch|pulstran|prony|pow2db|polystab|polyscale|poly2rc|poly2lsf|poly2ac|pmusic|pmtm|pmcov|phasez|phasedelay|periodogram|peig|pcov|pburg|parzenwin|nuttallwin|mscohere|modulate|medfilt1|maxflat|lsf2poly|lpc|lp2lp|lp2hp|lp2bs|lp2bp|levinson|latcfilt|latc2tf|lar2rc|kaiserord|kaiser|is2rc|invfreqz|invfreqs|intfilt|interp|impz|impinvar|ifft2|ifft|idct|icceps|hilbert|hann|hamming|grpdelay|goertzel|gmonopuls|gausswin|gaussfir|gauspuls|fvtool|freqz|freqspace|freqs|flattopwin|firrcos|firpmord|firpm|firls|fircls1|fircls|fir2|fir1|findpeaks|filtstates\.dfiir|filtstates|filtic|filtfilt|filternorm|filter2|filter|fftshift|fftfilt|fft2|fft|fdatool|eqtflength|ellipord|ellipap|ellip|dspfwiz|dspdata\.pseudospectrum|dspdata\.psd|dspdata\.msspectrum|dspdata|dpsssave|dpssload|dpssdir|dpssclear|dpss|downsample|diric|digitrevorder|dftmtx|dfilt\.statespace|dfilt\.scalar|dfilt\.parallel|dfilt\.latticemamin|dfilt\.latticemamax|dfilt\.latticearma|dfilt\.latticear|dfilt\.latticeallpass|dfilt\.fftfir|dfilt\.dfsymfir|dfilt\.dffirt|dfilt\.dffir|dfilt\.dfasymfir|dfilt\.df2tsos|dfilt\.df2t|dfilt\.df2sos|dfilt\.df2|dfilt\.df1tsos|dfilt\.df1t|dfilt\.df1sos|dfilt\.df1|dfilt\.delay|dfilt\.cascade|dfilt|demod|deconv|decimate|dct|db2pow|czt|cpsd|cplxpair|cov|corrmtx|corrcoef|convmtx|conv2|conv|chirp|cheby2|cheby1|chebwin|cheb2ord|cheb2ap|cheb1ord|cheb1ap|cfirpm|cell2sos|cconv|cceps|buttord|butter|buttap|buffer|bohmanwin|blackmanharris|blackman|bitrevorder|bilinear|besself|besselap|bartlett|barthannwin|aryule|armcov|arcov|arburg|angle|ac2rc|ac2poly|abs)\b/,
     name: "support.toolbox.signal-processing.matlab"},
   matlab_support_toolbox_spline: 
    {comment: "Matlab spline toolbox",
     match: 
      /(?<!\.)\b(tpaps|titanium|subplus|stmak|stcol|spterms|sprpp|spmak|splpp|splinetool|spcrv|spcol|spaps|spapi|spap2|sorted|slvblk|rsmak|rscvn|rpmak|ppmak|optknt|newknt|knt2mlt|knt2brk|getcurve|franke|fnzeros|fnxtr|fnval|fntlr|fnrfn|fnplt|fnmin|fnjmp|fnint|fndir|fnder|fncmb|fnchg|fnbrk|fn2fm|cscvn|csaps|csapi|csape|chbpnt|bspline|bspligui|brk2knt|bkbrk|aveknt|augknt|aptknt)\b/,
     name: "support.toolbox.spline.matlab"},
   matlab_support_toolbox_statistics: 
    {comment: "Matlab statistics toolbox",
     match: 
      /(?<!\.)\b(ztest|zscore|x2fx|wishrnd|wblstat|wblrnd|wblplot|wblpdf|wbllike|wblinv|wblfit|wblcdf|view|vartestn|vartest2|vartest|var|upperparams|unifstat|unifrnd|unifpdf|unifit|unifinv|unifcdf|unidstat|unidrnd|unidpdf|unidinv|unidcdf|type|ttest2|ttest|tstat|trnd|trimmean|treeval|treetest|treeprune|treefit|treedisp|tpdf|tinv|tiedrank|test|tdfread|tcdf|tblwrite|tblread|tabulate|surfht|summary|stepwisefit|stepwise|std|statset|statget|squareform|sortrows|sort|slicesample|skewness|silhouette|signtest|signrank|setlabels|set|segment|scatterhist|sampsizepwr|runstest|rstool|rsmdemo|rowexch|rotatefactors|robustfit|robustdemo|risk|ridge|replacedata|reorderlevels|regstats|regress|refline|refcurve|rcoplot|raylstat|raylrnd|raylpdf|raylinv|raylfit|raylcdf|ranksum|range|randtool|randsample|random|randg|quantile|qqplot|prune|procrustes|probplot|princomp|prctile|posterior|polyval|polytool|polyfit|polyconf|poisstat|poissrnd|poisspdf|poissinv|poissfit|poisscdf|perms|pearsrnd|pdist|pdf|pcares|pcacov|partialcorr|paretotails|pareto|parent|parallelcoords|ordinal|numnodes|nsegments|normstat|normspec|normrnd|normplot|normpdf|normlike|norminv|normfit|normcdf|nominal|nodesize|nodeprob|nodeerr|nlpredci|nlparci|nlintool|nlinfit|ncx2stat|ncx2rnd|ncx2pdf|ncx2inv|ncx2cdf|nctstat|nctrnd|nctpdf|nctinv|nctcdf|ncfstat|ncfrnd|ncfpdf|ncfinv|ncfcdf|nbinstat|nbinrnd|nbinpdf|nbininv|nbinfit|nbincdf|nanvar|nansum|nanstd|nanmin|nanmedian|nanmean|nanmax|nancov|mvtrnd|mvtpdf|mvtcdf|mvregresslike|mvregress|mvnrnd|mvnpdf|mvncdf|multivarichart|multcompare|moment|mode|mnrval|mnrnd|mnrfit|mnpdf|mlecov|mle|mhsample|mergelevels|median|mean|mdscale|manovacluster|manova1|maineffectsplot|mahal|mad|lsqnonneg|lsline|lscov|lowerparams|lognstat|lognrnd|lognpdf|lognlike|logninv|lognfit|logncdf|linkage|linhyptest|lillietest|lhsnorm|lhsdesign|leverage|levelcounts|kurtosis|kstest2|kstest|ksdensity|kruskalwallis|kmeans|join|johnsrnd|jbtest|jackknife|iwishrnd|isundefined|ismember|islevel|isbranch|iqr|invpred|interactionplot|inconsistent|icdf|hygestat|hygernd|hygepdf|hygeinv|hygecdf|hougen|hmmviterbi|hmmtrain|hmmgenerate|hmmestimate|hmmdecode|histfit|hist3|hist|harmmean|hadamard|gscatter|grpstats|grp2idx|gpstat|gprnd|gppdf|gplotmatrix|gplike|gpinv|gpfit|gpcdf|gname|gmdistribution|glyphplot|glmval|glmfit|gline|gevstat|gevrnd|gevpdf|gevlike|gevinv|gevfit|gevcdf|getlabels|get|geostat|geornd|geopdf|geomean|geoinv|geocdf|gamstat|gamrnd|gampdf|gamlike|gaminv|gamfit|gamcdf|gagerr|fullfact|fsurfht|fstat|frnd|friedman|fracfactgen|fracfact|fpdf|fit|finv|ff2n|fcdf|factoran|expstat|exprnd|exppdf|explike|expinv|expfit|expcdf|evstat|evrnd|evpdf|evlike|evinv|evfit|evcdf|eval|errorbar|ecdfhist|ecdf|dwtest|dummyvar|droplevels|disttool|dfittool|dendrogram|dcovary|daugment|datasetfun|dataset|cutvar|cuttype|cutpoint|cutcategories|crosstab|coxphfit|cov|corrcov|corrcoef|corr|cordexch|copulastat|copularnd|copulapdf|copulaparam|copulafit|copulacdf|cophenet|controlrules|controlchart|combnk|cmdscale|clusterdata|cluster|classregtree|classprob|classify|classcount|cholcov|children|chi2stat|chi2rnd|chi2pdf|chi2inv|chi2gof|chi2cdf|cdfplot|cdf|ccdesign|casewrite|caseread|capaplot|capability|canoncorr|candgen|candexch|boxplot|boundary|bootstrp|bootci|biplot|binostat|binornd|binopdf|binoinv|binofit|binocdf|betastat|betarnd|betapdf|betalike|betainv|betafit|betacdf|bbdesign|barttest|aoctool|ansaribradley|anovan|anova2|anova1|andrewsplot|addlevels|addedvarplot)\b/,
     name: "support.toolbox.statistics.matlab"},
   matlab_support_toolbox_symbolic_math: 
    {comment: "Matlab symbolic math toolbox",
     match: 
      /(?<!\.)\b(ztrans|zeta|vpa|uint8|uint64|uint32|uint16|triu|tril|taylortool|taylor|symsum|syms|sym2poly|sym|svd|subs|subexpr|sort|solve|size|sinint|single|simplify|simple|rsums|rref|round|real|rank|quorem|procread|pretty|poly2sym|poly|numden|null|mod|mhelp|mfunlist|mfun|mapleinit|maple|log2|log10|limit|latex|laplace|lambertw|jordan|jacobian|iztrans|inv|int8|int64|int32|int16|int|imag|ilaplace|ifourier|hypergeom|horner|heaviside|funtool|frac|fourier|fortran|floor|fix|finverse|findsym|factor|ezsurfc|ezsurf|ezpolar|ezplot3|ezplot|ezmeshc|ezmesh|ezcontourf|ezcontour|expm|expand|eq|eig|dsolve|double|dirac|digits|diff|diag|det|cosint|conj|compose|colspace|collect|coeffs|ceil|ccode)\b/,
     name: "support.toolbox.symbolic-math.matlab"},
   matlab_support_toolbox_system_identification: 
    {comment: "Matlab system identification toolbox",
     match: 
      /(?<!\.)\b(zpkdata|zpk|wavenet|view|unitgain|treepartition|timestamp|tfdata|tf|struc|step|ssdata|ss|spafdr|spa|size|simsd|sim|sigmoidnet|setstruc|setpname|setpar|setinit|set|selstruc|segment|saturation|rplr|rpem|roe|resid|resample|realdata|rbj|rarx|rarmax|pzmap|pwlinear|present|predict|polyreg|polydata|poly1d|plot|pexcit|pem|pe|oe|nyquist|nuderst|noisecnv|nlhw|nlarx|nkshift|neuralnet|n4sid|misdata|midprefs|merge|lintan|linear|linapp|ivx|ivstruc|ivar|iv4|isreal|init|impulse|ifft|idss|idresamp|idproc|idpoly|idnlmodel|idnlhw|idnlgrey|idnlarx|idmodel|idmdlsim|idinput|idgrey|idfrd|idfilt|ident|iddata|idarx|getreg|getpar|getinit|getexp|get|fselect|freqresp|frd|fpe|fft|ffplot|feedback|fcat|evaluate|etfe|diff|detrend|delayest|deadzone|d2c|customreg|customnet|cra|covf|compare|c2d|bode|bj|balred|arxstruc|arxdata|arx|armax|ar|aic|advice|addreg|EstimationInfo)\b/,
     name: "support.toolbox.system-identification.matlab"},
   matlab_support_toolbox_virtual_reality: 
    {comment: "Matlab virtual reality toolbox",
     match: 
      /(?<!\.)\b(vrworld|vrwhos|vrwho|vrview|vrspacemouse|vrsetpref|vrrotvec2mat|vrrotvec|vrrotmat2vec|vrplay|vrori2dir|vrnode|vrlib|vrjoystick|vrinstall|vrgetpref|vrfigure|vrdrawnow|vrdir2ori|vrclose|vrclear)\b/,
     name: "support.toolbox.virtual-reality.matlab"},
   matlab_support_toolbox_wavelet: 
    {comment: "Matlab wavelet toolbox",
     match: 
      /(?<!\.)\b(wvarchg|wtreemgr|wthrmngr|wthresh|wthcoef2|wthcoef|wtbxmngr|wtbo|wscalogram|write|wrev|wrcoef2|wrcoef|wpviewcf|wptree|wpthcoef|wpsplt|wprec2|wprec|wprcoef|wpjoin|wpfun|wpdencmp|wpdec2|wpdec|wpcutree|wpcoef|wpbmpen|wp2wtree|wnoisest|wnoise|wmulden|wmspca|wmaxlev|wkeep|wfusmat|wfusimg|wfilters|wfbmesti|wfbm|wextend|wentropy|wenergy2|wenergy|wdencmp|wden|wdcenergy|wdcbm2|wdcbm|wcodemat|wbmpen|waverec2|waverec|wavenames|wavemngr|wavemenu|waveinfo|wavefun2|wavefun|wavedemo|wavedec2|wavedec|wave2lp|upwlev2|upwlev|upcoef2|upcoef|treeord|treedpth|tnodes|thselect|symwavf|symaux|swt2|swt|shanwavf|set|scal2frq|readtree|read|rbiowavf|qmf|plot|pat2cwav|orthfilt|ntree|ntnode|noleaves|nodesplt|nodepar|nodejoin|nodedesc|nodeasc|mswthresh|mswden|mswcmptp|mswcmpscr|mswcmp|morlet|meyeraux|meyer|mexihat|mdwtrec|mdwtdec|mdwtcluster|lwtcoef2|lwtcoef|lwt2|lwt|lsinfo|ls2filt|liftwave|liftfilt|leaves|laurpoly|laurmat|iswt2|iswt|istnode|isnode|intwave|ind2depo|ilwt2|ilwt|idwt2|idwt|get|gauswavf|filt2ls|fbspwavf|entrupd|dyadup|dyaddown|dwtmode|dwt2|dwt|dtree|drawtree|displs|disp|detcoef2|detcoef|depo2ind|ddencmp|dbwavf|dbaux|cwt|coifwavf|cmorwavf|chgwdeccfs|cgauwavf|cfs2wpt|centfrq|bswfun|biorwavf|biorfilt|besttree|bestlevt|appcoef2|appcoef|allnodes|addlift)\b/,
     name: "support.toolbox.wavelet.matlab"},
   matlab_variable_function: 
    {comment: "MATLAB variables",
     match: /(?<!\.)\b(nargin|nargout|varargin|varargout)\b/,
     name: "variable.other.function.matlab"},
   not_equal_invalid: 
    {comment: "Not equal is written ~= not !=.",
     match: /\s*!=\s*/,
     name: "invalid.illegal.invalid-inequality.matlab"},
   number: 
    {comment: "Valid numbers: 1, .1, 1.1, .1e1, 1.1e1, 1e1, 1i, 1j, 1e2j",
     match: 
      /(?<=[\s\-\+\*\/\\=:\[\(\{,]|^)\d*\.?\d+([eE][+-]?\d)?([0-9&&[^\.]])*(i|j)?\b/,
     name: "constant.numeric.matlab"},
   operators: 
    {comment: "Operator symbols",
     match: 
      /\s*(==|~=|>|>=|<|<=|&|&&|:|\||\|\||\+|-|\*|\.\*|\/|\.\/|\\|\.\\|\^|\.\^)\s*/,
     name: "keyword.operator.symbols.matlab"},
   parens: 
    {begin: /\(/,
     beginCaptures: {0 => {name: "meta.parens.matlab"}},
     contentName: "meta.parens.matlab",
     end: "\\)",
     endCaptures: {0 => {name: "meta.parens.matlab"}},
     patterns: [{include: "#allofem"}, {include: "#end_in_parens"}]},
   special_characters: 
    {comment: "Operator symbols",
     match: 
      /((\%([\+\-0]?\d{0,3}(\.\d{1,3})?)(c|d|e|E|f|g|G|s|((b|t)?(o|u|x|X))))|\%\%|\\(b|f|n|r|t|\\))/,
     name: "constant.character.escape.matlab"},
   string: 
    {begin: /((?<=(\[|\(|\{|=|\s|;|:|,))|^)'/,
     beginCaptures: 
      {0 => {name: "punctuation.definition.string.begin.matlab"}},
     end: "'(?=(\\]|\\)|\\}|=|~|<|>|&|\\||-|\\+|\\*|\\.|\\^|\\||\\s|;|:|,))",
     endCaptures: {0 => {name: "punctuation.definition.string.end.matlab"}},
     name: "string.quoted.single.matlab",
     patterns: 
      [{include: "#escaped_quote"},
       {include: "#unescaped_quote"},
       {include: "#special_characters"}]},
   transpose: 
    {match: /((\w+)|(?<=\])|(?<=\)))\.?'/,
     name: "keyword.operator.transpose.matlab"},
   unescaped_quote: 
    {patterns: 
      [{match: /'(?=.)/, name: "invalid.illegal.unescaped-quote.matlab"}]},
   variable: 
    {comment: "Valid variable. Added meta to disable hilightinh",
     match: /\b[a-zA-Z]\w*\b/,
     name: "meta.variable.other.valid.matlab"},
   variable_assignment: 
    {comment: "Incomplete variable assignment.",
     match: /=\s*\.{0,2}\s*;?\s*$\n?/,
     name: "invalid.illegal.incomplete-variable-assignment.matlab"},
   variable_invalid: 
    {comment: 
      "No variables or function names can start with a number or an underscore.",
     match: /\b(_\w|\d+[_a-df-zA-DF-Z])\w*\b/,
     name: "invalid.illegal.invalid-variable-name.matlab"}},
 scopeName: "source.matlab",
 uuid: "48F8858B-72FF-11D9-BFEE-000D93589AF6"}
