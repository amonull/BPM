package raw

// The main template type holding all information that is inside a template. Note
// this type does not hold any raw types that is handled by other subtypes.
type Template struct {
	DataName        *PkgName          `xml:"name"`
	DataVersion     *PkgVersion       `xml:"version"`
	DataUrl         *PkgUrl           `xml:"url"`
	DataBpmDeps     *PkgBpmDeps       `xml:"bpmDeps"`
	DataHostDeps    *PkgHostDeps      `xml:"hostDeps"`
	DataConflicts   *PkgConflicts     `xml:"conflicts"`
	DataChecksums   *PkgChecksums     `xml:"checksums"`
	DataPermissions *PkgPermissions   `xml:"permissions"`
	DataManpages    *PkgManpages      `xml:"manpages"`
	DataCompletions []*PkgCompletions `xml:"completions"`
	DataDesktop     *PkgDesktop       `xml:"desktop"`
	DataFiles       *PkgFiles         `xml:"files"`
}

// subtype of Template that holds name information
type PkgName struct {
	DataName        string `xml:",chardata"`
	MetaDataAltName string `xml:"altName,attr"`
}

// subtype of Template that holds version information
type PkgVersion struct {
	DataVersion      string `xml:",chardata"`
	MetaDataRevision int    `xml:"revision,attr"`
}

// subtype of Template that holds url information
type PkgUrl struct {
	DataUrl string `xml:",chardata"`
}

// subtype of Template that holds dependency information (BPM dependency)
type PkgBpmDeps struct {
	DataDeps *PkgBaseDep `xml:",deps"`
}

// subtype of Template that holds dependecy information (Host Machine dependency)
type PkgHostDeps struct {
	DataDeps           *PkgBaseDep `xml:",deps"`
	MetaDataHostPkgMgr string      `xml:"PkgMgr,attr"`
}

// subtype of PkgHostDeps and PkgBpmDeps holds dependency information (generic raw info)
type PkgBaseDep struct {
	DataDep          string `xml:",chardata"`
	MetaDataUseAny   bool   `xml:"useAny,attr"`
	MetaDataOptional bool   `xml:"optional,attr"`
}

// subtype of Template holds conflict information
type PkgConflicts struct {
	DataConflicts string `xml:",chardata"`
}

// subtype of Template holds checksum information
type PkgChecksums struct {
	DataChecksums         string `xml:",chardata"`
	MetaDataDefaultMethod string `xml:"defaultMethod,attr"`
}

// subtype of Template holds permission information
type PkgPermissions struct {
	DataPermissions           string `xml:",chardata"`
	MetaDataDefaultPermission int    `xml:"defaultPermissions,attr"`
}

// subtype of Template holds manpage information
type PkgManpages struct {
	DataManpages string `xml:",chardata"`
}

// subtype of Template holds language completion information
type PkgCompletions struct {
	DataCompletions  string `xml:",chardata"`
	MetaDataLanguage string `xml:"language,attr"`
}

// subtype of Template holds desktop file information
type PkgDesktop struct {
	DataDesktop string `xml:",chardata"`
}

// subtype of Template holds generic package files information
type PkgFiles struct {
	DataFiles       string `xml:",chardata"`
	MetaDataBaseDir string `xml:"baseDir,attr"`
}
