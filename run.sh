#!/bin/bash

# Para servidor antigo
echo ""
echo "================================================================"
echo "⛔ Parando o servidor antigo..."
pkill -f "app.js"
echo "================================================================" 


# Startando o servidor
echo "================================================================"
echo "🚀 Iniciando servidor..."
npm start & 
echo "================================================================"


# Aguarda alguns segundos para o servidor subir
echo "================================================================"
echo "⏳ Aguardando o servidor iniciar..."
sleep 5
echo "================================================================"

# Função para exibir a mensagem de boas-vindas
exibir_mensagem_boas_vindas() {
    clear
    echo ""
    echo "============================================"
    echo "Olá!! seja Bem-vindo(a) - Desafio 03 da mentoria do Júlio de Lima!"
    read -p "Por favor, me diga seu Nome: " name
    echo "$name"
    clear
    echo -e "📌 Seja bem-vindo(a): $name\nPor gentileza escolha uma das opções abaixo:"
    echo "================================================================" 
}
exibir_mensagem_boas_vindas
# PS3=$'\nDigite o número da opção desejada: '
options=("Todos os testes" "Testes de Login" "Testes de forgot" "Sair")

select opt in "${options[@]}"
do
    case $opt in
        "Todos os testes")
            echo "▶️ Executando todos os testes..."
            npm test
            break
            ;;
        "Testes de Login")
            echo "🔍 Executando testes com tag [login]..."
            npm test --grep "\[login\]"
            break
            ;;
        "Testes de forgot")
            echo "✅ Executando testes com tag [sucesso]..."
            npm test --grep "\[forgot\]"
            break
            ;;
        "Sair")
            echo "👋 Obrigado $name volte sempre..."
            break
            ;;
        *) echo "⚠️ Vish!!! $name Opção inválida! Tente novamente.";;
    esac
     read -p "Pressione Enter para retornar ao inicio..."
done
