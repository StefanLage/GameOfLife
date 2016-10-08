# platform :ios, '9.0'

target 'GameOfLife' do
  use_frameworks!

  def testing_pods
    pod 'Quick'
    pod 'Nimble'
  end

  target 'GameOfLifeTests' do
    inherit! :search_paths
    testing_pods
  end

  target 'GameOfLifeUITests' do
    inherit! :search_paths
    testing_pods
  end

end
