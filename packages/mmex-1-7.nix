final: prev:  let 
  extraGIPackages = with prev; [ networkmanager upower playerctl ];
  vers = "1.7.0";
  sha256 = "sha256-X98H5gs7ipYsmo66i+Hi0VzskOSvZnq+ijKzEC40QKU=";
in 
(prev.mmex.overrideAttrs (old: 
  {
    version = vers;
    src = prev.fetchFromGitHub {
      owner = "moneymanagerex";
      repo = "moneymanagerex";
      rev = "v${vers}";
      fetchSubmodules = true;
      inherit sha256;
    };
    nativeBuildInputs = old.nativeBuildInputs ++(with prev; [
      lua
      appstream
      ccache
    ]);
    buildInputs = old.buildInputs ++ ( with prev; [
      wxsqlite3
      rapidjson
    ]);
  }
))
