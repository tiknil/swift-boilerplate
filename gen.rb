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
$boilerplate_project_name = 'Boilerplate'

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
    Utils.check_external_dependencies
  	verbose = options[:verbose]
  	project_name = options[:name]
  	if project_name == nil || project_name == "" || project_name == "name" 
  		abort "Nome progetto non valido"
  	end
  	project_name = project_name.gsub(" ","")

  	parent = File.expand_path("..", Dir.pwd)
  	dest_dir = parent + "/" + project_name

  	continue_to_create = options[:force]
  	if !continue_to_create 
  		puts "Vuoi avviare la generazione del nuovo progetto swift " + project_name.blue + " nella cartella " + dest_dir.red + "? (Y/n)"
			confirm = STDIN.gets.chomp
			if confirm == 'Y'
				continue_to_create = true
			end
		end
		if !continue_to_create
			abort "Alla prossima 👋🏻"
		else
			time = Benchmark.measure {
				puts "Avvio generazione nuovo progetto swift " + project_name.blue

				# 1. Creo la cartella dove mettere il nuovo progetto
				if File.exists? dest_dir 
					continue_to_ovveride = options[:force]
					if !continue_to_ovveride 
						puts "Esiste gia' una cartella con il nome del progetto, la vuoi sovrascrivere? (Y/n)"
						confirm = STDIN.gets.chomp
						if confirm == "Y"
							continue_to_ovveride = true
						end
					end
					if continue_to_ovveride
						FileUtils.rm_rf dest_dir
						FileUtils.mkdir dest_dir
					else
						abort "Alla prossima 👋🏻"
					end
  			else
  				FileUtils.mkdir dest_dir
  			end

				# 2. Copio tutti i file 
				FileUtils.cp_r $boilerplate_project_name , dest_dir, :verbose => true
				FileUtils.cp_r $boilerplate_project_name + "Tests", dest_dir, :verbose => true
				FileUtils.cp_r $boilerplate_project_name + "UITests", dest_dir, :verbose => true
				FileUtils.cp "Podfile", dest_dir, :verbose => true
				FileUtils.cp "project.yml", dest_dir, :verbose => true
				
				#3. Sostituisco ovunque "Boilerplate" con project_name
				replace_file_name_and_text_in_folder dest_dir, $boilerplate_project_name, project_name, verbose

        #4. Eseguo XCodeGen
        Dir.chdir dest_dir do 
          Utils.execute("xcodegen generate", verbose, true, "Generazione progetto XCode e file correlati (pod install incluso)")
        end
			}

			puts "\n"
			puts "Creazione nuovo progetto " + project_name.blue + " completata, benchmark #{time.real}"
		end
  end

  no_commands {

  	# Sostituisce nei nomi dei file e nel testo dei file il nome del progetto boilerplate con il nome del nuovo progetto
  	# @param dir cartella da gestire
  	# @param nome del progetto boilerplate
  	# @param nome del nuovo progetto 
  	def replace_file_name_and_text_in_folder dir, boilerplate_name, project_name, verbose
  		puts "dir: #{dir}, boilerplate_name #{boilerplate_name}, project_name #{project_name}"

  		Dir.chdir dir do 
  			Dir.glob("*").each do |file_name|
  				if File.directory? file_name
  					replace_file_name_and_text_in_folder("#{dir}/#{file_name}", boilerplate_name, project_name, verbose)
  				else
  					base_command = "sed -i '' 's/" + boilerplate_name + "/" + project_name + "/g'"
  					Utils.execute("#{base_command} #{file_name}", verbose, true, "Sostituzione #{boilerplate_name} nel file #{file_name}")
  				end
  				if file_name.include? boilerplate_name
  					newFolder = file_name.gsub(boilerplate_name, project_name)
  					FileUtils.mv(file_name, newFolder)
  				end
  			end
  		end
  	end
  }

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
    dependencies = ["xcodegen"]
    dependencies.each do |item|
      result = system "which #{item}", :out => File::NULL
      if !result
        puts "ATTENZIONE: " + item.red + " non risulta installato sul tuo sistema."
        puts "Le dipendenze esterne utilizzate da " + Utils.tool + " sono: " + (dependencies.map { |k| "'#{k}'" }.join(", "))
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

