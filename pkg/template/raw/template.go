package raw

import (
	"encoding/xml"
	"os"
)

func New(templatePath string) (*Template, error) {
	template := new(Template)
	fileData := make([]byte, 100)
	templateFile, err := os.Open(templatePath)
	if err != nil {
		return nil, err
	}
	defer templateFile.Close()

	_, err = templateFile.Read(fileData)
	if err != nil {
		return nil, err
	}

	err = xml.Unmarshal(fileData, &template)

	return template, nil
}
