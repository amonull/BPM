package file

import (
	"encoding/xml"
	"os"
)

func New(templatePath string) (*Template, error) {
	fileData, err := os.ReadFile(templatePath)
	if err != nil {
		return nil, err
	}

	template := new(Template)
	err = xml.Unmarshal(fileData, &template)

	return template, nil
}
