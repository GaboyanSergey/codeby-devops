#!/bin/bash
TARGET_DIR="$HOME/myfolder"
if [ ! -d "$TARGET_DIR" ]; then
    echo "Папка $TARGET_DIR не найдена"
    exit 0
fi
FILE_COUNT=$(find "$TARGET_DIR" -maxdepth 1 -type f | wc -l)
echo "Количество файлов в папке: $FILE_COUNT"
if [ -f "$TARGET_DIR/file2.txt" ]; then
    chmod 664 "$TARGET_DIR/file2.txt"
    echo "Права для file2.txt изменены на 664"
fi
find "$TARGET_DIR" -maxdepth 1 -type f -empty -delete
echo "Пустые файлы удалены."
for file in "$TARGET_DIR"/*; do
    if [ -f "$file" ]; then
        sed -n '1p' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
    fi
done
echo "Лишние строки удалены."
echo "Скрипт 2 выполнен успешно."
