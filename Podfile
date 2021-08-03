platform :ios, '12.1'

source 'https://cdn.cocoapods.org/'
source 'git@bitbucket.org:tiknil/tiknilpods.git'

target 'Boilerplate' do
  use_frameworks!
  inhibit_all_warnings!

  # Pods for Boilerplate
  pod 'SwiftGen', '~> 6.0' # Tool per generare codice swift di riferimento alle risorse (stringhe, immagini, ecc)
  pod 'Swinject', '~> 2.7' # IoC Container per dependency injection
  pod 'RxCocoa', '~> 5.1' # Functional Reactive Programming
  pod 'RxOptional', '~> 4.1' # Permette di filtrare elementi nil trasformando observable optional in wrapped
  pod 'SnapKit', '~> 5.0' # Gestione semplificata delle constraints da codice
  pod 'Fakery', '~> 4.1' # Utilizzato per la generazione di dati fake
  pod 'Timepiece', '~> 1.3' # Gestione evoluta delle date
  pod 'lottie-ios', '~> 3.1' # Animazioni Lottie
  
  pod 'IQKeyboardManager', '~> 6.5' # Mantenimento della visualizzazione della tastiera

  target 'BoilerplateTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BoilerplateUITests' do
    # Pods for testing
  end

end

post_install do |pi|
    pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1'
        end
    end
end
