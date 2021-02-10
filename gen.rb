#!/usr/bin/env ruby
# encoding: utf-8
# Questo script serve generare un nuovo progetto iOS a partire dal boilerplate
#
# © 2021 Tiknil
#

$version = "0.1.0"
$year = '2021'
$debug = false
$tool_name = 'Swift Project Generator'

if ARGV.length == 0 || ARGV[0] == 'help'
  puts "#{$tool_name} \nby Tiknil © #{$year} - Version " + $version + "\n\n"
end

begin
  # Controllo dipendenze
  require 'thor'
  require 'fileutils'         # per varie utilità sul file system
  require 'terminal-table'    # per visualizzare tabelle ASCII nel terminale
  require 'colorize'          # per colorare gli output nel terminale
  require 'tempfile'          # per creare dei file temporanei in memoria
  require 'ruby-progressbar'  # per le progress bar nel terminale
  require 'tty-spinner'       # per gli spinner indefiniti nel terminale
  require 'mysql2'						# per la connessione con i db mysql
  require 'csv'							  # per la lettura dei csv
  require 'benchmark'					# per il benchmark dei processi
rescue LoadError
  # Dipendenze mancanti
  puts "Dipendenze mancanti. Assicurati di aver eseguito il comando `bundle install` in questa stessa cartella"
  abort
end

################################################################################
##                              CLASSES                                       ##
################################################################################

class SwiftProjectGenerator < Thor
  class_option :force, :type => :boolean, :desc => "Non prevede input da parte dell'utente", :aliases => '-f', :default => false
  class_option :verbose, :type => :boolean, :desc => "Printa a schermo le sotto-operazioni", :aliases => '-v', :default => false

	desc "version", "Visualizza la versione corrente di Elios"
  def version
    Utils.header
  end

  option :name, :desc => "Il nome del progetto che si vuole creare. EVITARE SPAZI, CARATTERI SPECIALI, ETC", :aliases => '-n'
  desc "proj", "Genera un nuovo progetto a partire dal boilerplate swift"
  def proj
  	Utils.header
  	verbose = options[:verbose]
  	project_name = options[:name]

  	Utils.print("Generazione del nuovo progetto swift #{project_name}", verbose)

  end

end

class Utils
  # Controlla se il comando è eseguito con privilegi di amministratore, necessari per eseguire le operazioni seguenti
  def self.require_authentication
    if Process.uid != 0
      abort "Il comando dev'essere eseguito con privilegi di amministratore (sudo)"
    end
  end

  def self.require_not_sudo
    if Process.uid == 0
      abort "Il comando NON deve essere eseguito con privilegi di amministratore (sudo)"
    end
  end

  # Controlla le dipendenze esterne
  def self.check_external_dependencies
    dependencies = ["sqlite3"]
    dependencies.each do |item|
      result = system "which #{item}", :out => File::NULL
      if !result
        puts "ATTENZIONE: " + item.red + " non risulta installato sul tuo sistema."
        puts "Le dipendenze esterne utilizzate da " + Utils.elios + " sono: " + (dependencies.map { |k| "'#{k}'" }.join(", "))
        abort
      end
    end
  end

  # Restituisce l'output per il terminale di Skipper
  def self.tool
    return "#{$tool_name}".colorize(:color => :light_black, :background => :light_magenta)
  end

  def self.header
    puts Utils.tool + "\nby Tiknil © #{$year} - Version " + $version + "\n"
  end

  # Esegue il comando passato, se necessario mandando l'output a terminale
  # Restituisce il risultato del comando eseguito da system()
  def self.execute(command, verbose = false, spinner_visible = true, title = "", done_message = "")
    if spinner_visible
      spinner = TTY::Spinner.new(":spinner #{title} \r", :clear => true, :hide_cursor => true)
      spinner.auto_spin
    end
    if !verbose
      result = system(command, :out => File::NULL)
    else
      if $debug
        puts "Exec command: #{command}"
      end
      result = system(command)
    end
    if spinner_visible
      spinner.success
    end
    return result
  end

  def self.wait(seconds, title)
    spinner = TTY::Spinner.new(":spinner #{title} \r", :clear => true, :hide_cursor => true)
    spinner.run do
      sleep seconds
    end
  end

  def self.print(text, verbose)
  	if verbose
  		puts text
  	end
  end
end

#Command line entry point
SwiftProjectGenerator.start(ARGV)

