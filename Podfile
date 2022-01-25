source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/hyperledger/indy-sdk.git'
platform :ios, '10'

workspace 'Indy.xcworkspace'

def appPods
    pod 'libsodium'
    pod 'libzmq',"4.2.3"
    pod 'OpenSSL-XM'
    pod 'libindy', "1.15.0"
end

target 'Indy-demo' do
    project 'Indy-demo'
    pod 'CoreBitcoin', :podspec => 'https://raw.github.com/oleganza/CoreBitcoin/master/CoreBitcoin.podspec'

    target 'Indy-demoTests' do
	inherit! :search_paths
    end
end


target 'Indy' do
    project 'Indy'
    appPods
end

# ignore all warnings from all pods
#inhibit_all_warnings!

post_install do |installer|require 'fileutils'
    FileUtils.cp_r('platform.hpp', 'Pods/libzmq/src/platform.hpp', :remove_destination => true)

    installer.pods_project.targets.each do |target|
      if target.name == 'libzmq'
        target.build_configurations.each do |config|
            config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'ZMQ_BUILD_DRAFT_API=1', 'ZMQ_USE_KQUEUE']
        end
      end
      if target.name == 'libsodium'
        target.build_configurations.each do |config|
            config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'NATIVE_LITTLE_ENDIAN=1 PACKAGE_NAME=\"libsodium\" PACKAGE_TARNAME=\"libsodium\" PACKAGE_VERSION=\"1.0.12\" PACKAGE_STRING=\"libsodium\ 1.0.12\" PACKAGE_BUGREPORT=\"https://github.com/jedisct1/libsodium/issues\" PACKAGE_URL=\"https://github.com/jedisct1/libsodium\" PACKAGE=\"libsodium\" VERSION=\"1.0.12\" HAVE_PTHREAD_PRIO_INHERIT=1 HAVE_PTHREAD=1 STDC_HEADERS=1 HAVE_SYS_TYPES_H=1 HAVE_SYS_STAT_H=1 HAVE_STDLIB_H=1 HAVE_STRING_H=1 HAVE_MEMORY_H=1 HAVE_STRINGS_H=1 HAVE_INTTYPES_H=1 HAVE_STDINT_H=1 HAVE_UNISTD_H=1 _POSIX_PTHREAD_SEMANTICS=1 NATIVE_LITTLE_ENDIAN=1 HAVE_WEAK_SYMBOLS=1 CPU_UNALIGNED_ACCESS=1 CONFIGURED=1']
        end
      end
    end
end
