#!/bin/bash
set -e

function echodate() { date '+%Y-%m-%d %H:%M:%S'; }
function echoinfo() { echo "`echodate` [INFO] $*"; }
function echoerro() { echo "`echodate` [ERRO] $*"; }

function ajuda() {
  echo "Use: `basename $0` [opcoes]"
  echo
  echo "Necessário informar o nome do modulo como parametro"
  echo
  exit 1
}


# Unico diretorio de execucao ao longo de todo script
cd "`dirname $0`"

if [ $1 ]; then
  echoinfo "[$1] Aplicando configurações do Moduloe"
  puppet apply \
   --show_diff \
   --detailed-exitcodes \
   --modulepath=modules \
   --hiera_config=hiera_config.yaml \
   --execute "include $1" && CODE=0 || CODE=$?
  case $CODE in
    0) echoinfo "[$1] Sem alteracoes" ;;
    2) echoinfo "[$1] Houveram alteracoes de configuracao" ;;
    *) exit $CODE ;;
  esac
else
  ajuda
fi

echoinfo "Atualizacao concluida com sucesso"
