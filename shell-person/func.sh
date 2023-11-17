#!/bin/bash


prompt_two_lines() {
  echo "export PS1='\[\e[1;37m\]\u@\h \[\e[36m\]\w'"
  echo -n "\\$ '"
}


list_colors() {
  echo "1. Vermelho"
  echo "2. Verde"
  echo "3. Amarelo"
  echo "4. Azul"
  echo "5. Roxo"
  echo "6. Ciano"
  echo "7. Branco"
}


get_color_code() {
  local choice=$1
  local type=$2

  case $choice in
    1) color_code="\[\e[${type}31m\]" ;;
    2) color_code="\[\e[${type}32m\]" ;;
    3) color_code="\[\e[${type}33m\]" ;;
    4) color_code="\[\e[${type}34m\]" ;;
    5) color_code="\[\e[${type}35m\]" ;;
    6) color_code="\[\e[${type}36m\]" ;;
    7) color_code="\[\e[${type}37m\]" ;;
    *) color_code="" ;;
  esac

  echo -n $color_code
}


apply_config() {
  if [ -f temp_ps1.sh ]; then
  	source temp_ps1.sh
  	echo "Customização aplicada com sucesso!"

  	echo "Deseja salvar as configurações no arquivo de inicialização? (y/n)"
 	 read save_choice

  if [ "$save_choice" == "y" ]; then
    	echo "source $(pwd)/temp_ps1.sh" >> ~/.bashrc  
    	echo "Configurações adicionadas ao seu arquivo de perfil para aplicação automática."
  else
    	echo "Configurações não salvas no arquivo de perfil. Elas serão aplicadas apenas nesta sessão."
  fi
else
  echo "Nenhuma customização encontrada. Execute config.sh para configurar."
fi

bash

}


print_menu() {
  echo "Configuração personalizada:"
  echo "1. Mudar cor do texto"
  echo "2. Mudar cor do fundo"
  echo "3. Exibir apenas o nome do usuário"
  echo "4. Prompt em duas linhas"
  echo "5. Personalização extra"
  echo "6. Exibir caminho completo ou abreviado"
  echo "7. Exibir timestamp no prompt"
  #echo "8. Aplicar configuração"
  echo "9. Sair"
}

