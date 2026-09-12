using System;
using System.Collections.Generic;
using System.IO;

const string fileName = "notes.txt";
var notes = File.Exists(fileName) ? new List<string>(File.ReadAllLines(fileName)) : new List<string>();

while (true)
{
    Console.WriteLine("\nNotes CLI");
    Console.WriteLine("1. Add note");
    Console.WriteLine("2. List notes");
    Console.WriteLine("3. Clear notes");
    Console.WriteLine("0. Exit");
    Console.Write("Choose: ");

    var choice = Console.ReadLine();

    if (choice == "1")
    {
        Console.Write("Note: ");
        var note = Console.ReadLine()?.Trim();
        if (!string.IsNullOrWhiteSpace(note))
        {
            notes.Add($"[{DateTime.Now:yyyy-MM-dd HH:mm}] {note}");
            File.WriteAllLines(fileName, notes);
            Console.WriteLine("Saved.");
        }
    }
    else if (choice == "2")
    {
        if (notes.Count == 0)
        {
            Console.WriteLine("No notes yet.");
            continue;
        }

        for (int i = 0; i < notes.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {notes[i]}");
        }
    }
    else if (choice == "3")
    {
        notes.Clear();
        File.WriteAllText(fileName, string.Empty);
        Console.WriteLine("All notes cleared.");
    }
    else if (choice == "0")
    {
        break;
    }
}
