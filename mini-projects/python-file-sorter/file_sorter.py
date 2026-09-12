from pathlib import Path
import shutil

CATEGORIES = {
    "images": {".jpg", ".jpeg", ".png", ".gif", ".webp", ".svg"},
    "documents": {".pdf", ".docx", ".txt", ".xlsx", ".pptx"},
    "videos": {".mp4", ".mkv", ".mov", ".avi"},
    "audio": {".mp3", ".wav", ".m4a", ".flac"},
    "archives": {".zip", ".rar", ".7z", ".tar", ".gz"},
}


def category_for(path: Path) -> str:
    extension = path.suffix.lower()
    for category, extensions in CATEGORIES.items():
        if extension in extensions:
            return category
    return "others"


def organize(folder: str) -> None:
    root = Path(folder).expanduser().resolve()
    if not root.exists() or not root.is_dir():
        raise ValueError(f"Folder not found: {root}")

    moved = 0
    for item in root.iterdir():
        if not item.is_file():
            continue
        target_dir = root / category_for(item)
        target_dir.mkdir(exist_ok=True)
        target_path = target_dir / item.name
        if target_path.exists():
            target_path = target_dir / f"{item.stem}_copy{item.suffix}"
        shutil.move(str(item), str(target_path))
        moved += 1

    print(f"Organized {moved} files in {root}")


if __name__ == "__main__":
    folder_path = input("Folder path: ").strip().strip('"')
    organize(folder_path)
