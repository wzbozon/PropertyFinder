source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!
inhibit_all_warnings!

def commonPods
    
    # The easiest way to marshall and unmarshall Dictionary representations such as JSON representation
    pod 'EasyMapping', '~> 0.15.5'
    
    # A delightful networking framework for iOS, OS X, watchOS, and tvOS.
    pod 'AFNetworking', '~> 3.0'
    
    # ARC and GCD Compatible Reachability Class for iOS and MacOS. Drop in replacement for Apple Reachability
    pod 'Reachability', '~> 3.1.1'
    
    # A clean and lightweight progress HUD for your iOS and tvOS app.
    pod 'SVProgressHUD', '~> 2.0.3'
    
    # Asynchronous image downloader with cache support as a UIImageView category
    pod 'SDWebImage', '~> 3.8'
    
    # The 2.x ReactiveCocoa Objective-C API: Streams of values over time
    pod 'ReactiveObjC', '~> 3.0.0'

end

def testing_pods
    # Mock objects for Objective-C
    pod 'OCMock', '~> 3.4'
end

target 'PropertyFinder' do

    commonPods
    
end

target 'PropertyFinderTests' do
    
    commonPods
    testing_pods
    
end

target 'PropertyFinderUITests' do
    
    commonPods
    testing_pods
    
end

post_install do | installer |
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'YES'
        end
    end
end
