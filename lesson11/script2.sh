#!/bin/bash

readonly TARGET_DIR_NAME="myfolder"
readonly TARGET_DIR="$HOME/$TARGET_DIR_NAME"
# Имя файла, права которого нужно исправить
readonly FILE_TO_CHMOD="file2.txt"
# Новые права
readonly NEW_PERMISSIONS="664"

# Функция, возвращающая 0 при удаче, 1 при неудаче
check_directory_exists() {
    if [ ! -d "$TARGET_DIR" ]; then
        echo "Ошибка: Папка $TARGET_DIR не найдена." >&2
        return 1
    fi
    return 0
}

# Функция подсчета файлов
count_files() {
    local count
    count=$(find "$TARGET_DIR" -maxdepth 1 -type f | wc -l)
    echo "Количество файлов в папке: $count"
}

# Функция исправления прав
fix_permissions() {
    local file_path="$TARGET_DIR/$FILE_TO_CHMOD"
    if [ -f "$file_path" ]; then
        chmod "$NEW_PERMISSIONS" "$file_path"
        echo "Права для $FILE_TO_CHMOD изменены на $NEW_PERMISSIONS."
    else
        echo "Файл $FILE_TO_CHMOD не найден, пропускаем."
    fi
}

# Функция удаления пустых файлов
remove_empty_files() {
    find "$TARGET_DIR" -maxdepth 1 -type f -empty -delete
    echo "Пустые файлы удалены."
}

# Функция обрезки файлов до первой строки
truncate_files_to_first_line() {
    local file
    for file in "$TARGET_DIR"/*; do
        if [ -f "$file" ]; then
            sed -n '1p' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
        fi
    done
    echo "Лишние строки удалены."
}

# Главная функция
main() {
    echo "Запуск скрипта 2..."

    if ! check_directory_exists; then
        exit 0
    fi

    count_files
    fix_permissions
    remove_empty_files
    truncate_files_to_first_line

    echo "Скрипт 2 успешно выполнен."
    return 0
}

# Запуск основной функции
main
