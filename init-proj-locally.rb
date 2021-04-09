#!/usr/bin/env ruby
# encoding: utf-8
# Questo script serve inizializzare un progetto iOS in locale
#
# © 2021 Tiknil
#

# Controllo la presenza nel sistema di xcodegen
result = system "which xcodegen", :out => File::NULL
if !result
  puts "ATTENZIONE: `xcodegen` non risulta installato sul tuo sistema. Esegui `brew install xcodegen per installarlo`"
  abort
end

# Eseguo xcodegen per la prima volta sul progetto
result = system "xcodegen generate"

begin 
	require 'fileutils'         # per varie utilità sul file system
rescue LoadError
  # Dipendenze mancanti
  puts "Dipendenze mancanti"
  abort
end

# Applico i privilegi di esecuzione
puts "Assegno i permessi di esecuzione a tutti i git-hooks"
FileUtils.chmod_R "u+x", '.githooks', verbose: true

# Applico i githook perdisposti
puts "Carico i githooks nella cartella del progetto .git/hooks"
FileUtils.cp_r ".githooks/.", ".git/hooks", verbose: true

puts "👍🏻"