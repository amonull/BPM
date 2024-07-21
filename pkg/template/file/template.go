package file

import (
	"encoding/xml"
	"os"
)

func New(templatePath string) (*Template, error) {
	templateFile, err := os.Open(templatePath)
	if err != nil {
		return nil, err
	}
	defer templateFile.Close()

	fileData := make([]byte, 100)

	_, err = templateFile.Read(fileData)
	if err != nil {
		return nil, err
	}

	template, _ := xml.Marshal(fileData)

	return template, nil
}
