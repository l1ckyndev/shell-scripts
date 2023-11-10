#!/bin/bash

check_dependencies() {
    command -v zip >/dev/null 2>&1 || { echo >&2 "O comando 'zip' não está instalado. Instale antes de prosseguir."; exit 1; }
    command -v unzip >/dev/null 2>&1 || { echo >&2 "O comando 'unzip' não está instalado. Instale antes de prosseguir."; exit 1; }
}

display_menu() {
    echo "Menu:"
    echo "1. Escolher/criar arquivo .zip"
    echo "2. Listar informações do arquivo .zip"
    echo "3. Listar conteúdo do arquivo .zip"
    echo "4. Pré-visualizar arquivo do .zip"
    echo "5. Adicionar arquivos ao .zip"
    echo "6. Remover arquivos do .zip"
    echo "7. Extrair todo o conteúdo do .zip"
    echo "8. Extrair arquivos específicos do .zip"
    echo "9. Sair"
}

choose_or_create_zip() {
    read -p "Digite o nome do arquivo .zip ou crie um novo: " zip_file
}

list_zip_info() {
    unzip -v $zip_file
}

list_zip_content() {
    unzip -l $zip_file
}

preview_zip_file() {
    read -p "Digite o nome do arquivo para pré-visualização: " preview_file
    unzip -p $zip_file $preview_file
}

add_files_to_zip() {
    read -p "Digite os nomes dos arquivos a serem adicionados (separados por espaço): " files_to_add
    zip -u $zip_file $files_to_add
}

remove_files_from_zip() {
    read -p "Digite os nomes dos arquivos a serem removidos (separados por espaço): " files_to_remove
    zip -d $zip_file $files_to_remove
}

extract_all_from_zip() {
    unzip $zip_file
}

extract_specific_from_zip() {
    read -p "Digite os nomes dos arquivos a serem extraídos (separados por espaço): " files_to_extract
    unzip $zip_file $files_to_extract
}

main() {
    check_dependencies

    while true; do
        display_menu

        read -p "Escolha uma opção (1-9): " option

        case $option in
            1) choose_or_create_zip ;;
            2) list_zip_info ;;
            3) list_zip_content ;;
            4) preview_zip_file ;;
            5) add_files_to_zip ;;
            6) remove_files_from_zip ;;
            7) extract_all_from_zip ;;
            8) extract_specific_from_zip ;;
            9) echo "Saindo do script."; exit 0 ;;
            *) echo "Opção inválida. Tente novamente." ;;
        esac
    done
}

main

