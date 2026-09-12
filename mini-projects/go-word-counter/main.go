package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
    "unicode/utf8"
)

func main() {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter text: ")

    text, _ := reader.ReadString('\n')
    text = strings.TrimSpace(text)

    words := strings.Fields(text)
    characters := utf8.RuneCountInString(text)

    fmt.Println("Words:", len(words))
    fmt.Println("Characters:", characters)
}
