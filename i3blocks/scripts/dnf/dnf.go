package main

import (
	"bytes"
	"fmt"
	"log"
	"os/exec"
	"strings"
)

func handle_error(err error) {
	if err != nil {
		log.Fatalln("  " + err.Error() + " ")
	}
}

func main() {
	cmd := exec.Command("dnf", "check-update")
	out, err := cmd.Output()
	handle_error(err)
	log.Println(string(out))

	cmd = exec.Command("grep", "updates")
	cmd.Stdin = bytes.NewReader(out)
	out, err = cmd.Output()
	handle_error(err)
	log.Println(string(out))

	cmd = exec.Command("wc", "-l")
	cmd.Stdin = bytes.NewReader(out)
	out, err = cmd.Output()
	handle_error(err)
	log.Println(string(out))

	fmt.Println("  " + strings.Trim(string(out), "\n\t\r ") + " ")
}
