package main

import (
	"encoding/xml"
	"fmt"
	"log"
	"os"

	template "github.com/amonull/BPM/pkg/template/file"
)

func tmpWriteFullXml() {
	pkgName := &template.PkgName{
		DataName:        "trueName",
		MetaDataAltName: "altName",
	}

	pkgVersion := &template.PkgVersion{
		DataVersion:      "version",
		MetaDataRevision: 1,
	}

	pkgUrl := &template.PkgUrl{
		DataUrl: "url1 url2",
	}

	pkgBaseDeps := &template.PkgBaseDep{
		DataDep:          "dep1 dep2",
		MetaDataUseAny:   true,
		MetaDataOptional: false,
	}

	pkgBpmDeps := &template.PkgBpmDeps{
		DataDeps: pkgBaseDeps,
	}

	pkgHostDeps := &template.PkgHostDeps{
		DataDeps:           pkgBaseDeps,
		MetaDataHostPkgMgr: "xbps",
	}

	pkgConflicts := &template.PkgConflicts{
		DataConflicts: "conflict1 conflict2",
	}

	pkgChecksums := &template.PkgChecksums{
		DataChecksums:         "checksum1 checksum2",
		MetaDataDefaultMethod: "SHA256",
	}

	pkgPermissions := &template.PkgPermissions{
		DataPermissions:           "permissions1 permission2",
		MetaDataDefaultPermission: 744,
	}

	pkgManpages := &template.PkgManpages{
		DataManpages: "manpage1 manpage2",
	}

	pkgCompletions := &template.PkgCompletions{
		DataCompletions:  "completion1 completion2",
		MetaDataLanguage: "fish",
	}

	pkgDesktop := &template.PkgDesktop{
		DataDesktop: "desktop1 desktop2",
	}

	pkgFiles := &template.PkgFiles{
		DataFiles:       "file1 file2",
		MetaDataBaseDir: "baseDirLocation",
	}

	template := &template.Template{
		DataName:        pkgName,
		DataVersion:     pkgVersion,
		DataUrl:         pkgUrl,
		DataBpmDeps:     pkgBpmDeps,
		DataHostDeps:    pkgHostDeps,
		DataConflicts:   pkgConflicts,
		DataChecksums:   pkgChecksums,
		DataPermissions: pkgPermissions,
		DataManpages:    pkgManpages,
		DataCompletions: []*template.PkgCompletions{pkgCompletions},
		DataDesktop:     pkgDesktop,
		DataFiles:       pkgFiles,
	}

	out, _ := xml.MarshalIndent(template, "", "    ")
	fmt.Println(string(out))

	xmlFile, _ := os.Create("xmlFile.xml")
	xmlFile.WriteString(xml.Header)
	xmlFile.Write(out)
}

func tmpReadFullXml() {
	template, err := template.New("xmlFile.xml")
	if err != nil {
		log.Panicln(err)
	}

	fmt.Println(template.DataName.DataName)
}

func main() {
	readFullXml()
}
