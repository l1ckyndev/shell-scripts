#!/bin/bash
source func.sh

while true; do
  print_menu
  read choice

  case $choice in
    1)
      echo "Escolha uma cor para o texto:"
      list_colors
      read text_color_choice

      case $text_color_choice in
        1) text_color='\[\e[31m\]' ;;
        2) text_color='\[\e[32m\]' ;;
        3) text_color='\[\e[33m\]' ;;
        4) text_color='\[\e[34m\]' ;;
        5) text_color='\[\e[35m\]' ;;
        6) text_color='\[\e[36m\]' ;;
        7) text_color='\[\e[37m\]' ;;
        *) text_color="" ;;
      esac

      if [ -n "$text_color" ]; then
        echo "export PS1='${text_color}\u@\h \W\$ \[\e[0m\]'" > temp_ps1.sh
        echo "Cor do texto escolhida: $text_color"
      else
        echo "Escolha inválida"
      fi
      ;;
    2)
      echo "Escolha uma cor para o fundo:"
      list_colors
      read bg_color_choice

      case $bg_color_choice in
        1) bg_color='\[\e[41m\]' ;;
        2) bg_color='\[\e[42m\]' ;;
        3) bg_color='\[\e[43m\]' ;;
        4) bg_color='\[\e[44m\]' ;;
        5) bg_color='\[\e[45m\]' ;;
        6) bg_color='\[\e[46m\]' ;;
        7) bg_color='\[\e[47m\]' ;;
        *) bg_color="" ;;
      esac

      if [ -n "$bg_color" ]; then
        echo "export PS1='${bg_color}\u@\h \W\$ \[\e[0m\]'" > temp_ps1.sh
        echo "Cor do fundo escolhida: $bg_color"
      else
        echo "Escolha inválida"
      fi
      ;;    

    3)
      echo "export PS1='\u\$ '" > temp_ps1.sh
      echo "Prompt configurado para exibir apenas o nome do usuário"
      ;;

    4)
      prompt_two_lines
      echo -n > temp_ps1.sh  # Limpa o arquivo para evitar duplicatas
      ;;
    
    5)
      echo "Escolha a personalização extra:"
      echo "a. Texto personalizado"
      echo "b. Estilo do texto"
      read extra_choice

      case $extra_choice in
        a)
          echo "Digite o texto personalizado:"
          read custom_text
          echo "export PS1='${custom_text} \[\e[0m\]'" > temp_ps1.sh
          echo "Texto personalizado adicionado ao prompt"
          ;;
        b)
          echo "Escolha o estilo do texto:"
          echo "1. Negrito"
          echo "2. Sublinhado"
          echo "3. Pisca"
          read style_choice

          case $style_choice in
            1)
              echo "export PS1='\[\e[1m\]\u@\h \W\$ \[\e[0m\]'" > temp_ps1.sh
              echo "Estilo de texto escolhido: Negrito"
              ;;
            2)
              echo "export PS1='\[\e[4m\]\u@\h \W\$ \[\e[0m\]'" > temp_ps1.sh
              echo "Estilo de texto escolhido: Sublinhado"
              ;;
            3)
              echo "export PS1='\[\e[5m\]\u@\h \W\$ \[\e[0m\]'" > temp_ps1.sh
              echo "Estilo de texto escolhido: Pisca"
              ;;
            *)
              echo "Escolha inválida"
              ;;
          esac
          ;;
        *)
          echo "Escolha inválida"
          ;;
      esac
      ;;
    6)
      echo "Escolha exibir o caminho completo ou abreviado:"
      echo "1. Caminho completo"
      echo "2. Caminho abreviado"
      read path_choice

      case $path_choice in
        1)
          echo "export PS1='\[\e[1;37m\]\u@\h \[\e[36m\]\w\[\e[0m\] \$ '" > temp_ps1.sh
          echo "Exibição do caminho configurada para completo"
          ;;
        2)
          echo "export PS1='\[\e[1;37m\]\u@\h \[\e[36m\]\W\[\e[0m\] \$ '" > temp_ps1.sh
          echo "Exibição do caminho configurada para abreviado"
          ;;
        *)
          echo "Escolha inválida"
          ;;
      esac
      ;;
    7)
      echo "Escolha exibir o timestamp no prompt:"
      echo "1. Exibir timestamp"
      echo "2. Não exibir timestamp"
      read timestamp_choice

      case $timestamp_choice in
        1)
          echo "export PS1='\[\e[1;37m\]\u@\h \[\e[36m\]\w \[\e[1;31m\]\t\[\e[0m\] \$ '" > temp_ps1.sh
          echo "Timestamp configurado para ser exibido"
          ;;
        2)
          echo "export PS1='\[\e[1;37m\]\u@\h \[\e[36m\]\w\[\e[0m\] \$ '" > temp_ps1.sh
          echo "Timestamp configurado para não ser exibido"
          ;;
        *)
          echo "Escolha inválida"
          ;;
      esac
      ;;
    8)
      apply_config
      break
      ;;
    9)
      echo "Saindo..."
      break
      ;;
    *)
      echo "Escolha inválida"
      ;;
  esac
done

