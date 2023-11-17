#!/bin/bash


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

