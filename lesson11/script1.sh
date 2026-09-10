#!/bin/bash

# Имя целевой папки
readonly TARGET_DIR_NAME="myfolder"
# Путь к целевой папке
readonly TARGET_DIR="$HOME/$TARGET_DIR_NAME"
# Количество случайных символов для файла 3
readonly RANDOM_STRING_LENGTH=20

# Функция возвращающая 0 при успехе, 1 при неудаче
create_target_directory() {
    if ! mkdir -p "$TARGET_DIR"; then
        echo "Ошибка: Не удалось создать папку $TARGET_DIR" >&2
        return 1
    fi
    return 0
}

# Функция для создания файла 1 
create_file1() {
    local file_path="$TARGET_DIR/file1.txt"
    {
        echo "Привет, мир!"
        date
    } > "$file_path"
}

# Функция для создания файла 2 
create_file2() {
    local file_path="$TARGET_DIR/file2.txt"
    touch "$file_path"
    chmod 777 "$file_path"
}

# Функция для создания файла 3 
create_file3() {
    local file_path="$TARGET_DIR/file3.txt"
    # Генерируем случайную строку и записываем в файл
    head -c "$RANDOM_STRING_LENGTH" /dev/urandom | tr -dc 'a-zA-Z0-9' > "$file_path"
    echo "" >> "$file_path" # Добавляем перенос строки для красоты
}

# Функция для создания файлов 4 и 5 
create_empty_files() {
    touch "$TARGET_DIR/file4.txt"
    touch "$TARGET_DIR/file5.txt"
}

# Главная функция
main() {
    echo "Запуск скрипта 1..."

    if ! create_target_directory; then
        exit 1
    fi

    create_file1
    create_file2
    create_file3
    create_empty_files

    echo "Скрипт 1 успешно выполнен."
    return 0
}

# Запуск основной функции
main
