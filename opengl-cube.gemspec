Gem::Specification.new do |s|
  s.name               = "opengl-cube"
  s.version            = "0.0.1"
  s.default_executable = "opengl-cube"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gao Chao"]
  s.date = %q{2012-10-21}
  s.description = %q{A gem play with cube rendered by opengl}
  s.email = %q{reterclose@gmail.com}
  s.test_files = ["test/test_opengl-cube.rb"]
  s.homepage = %q{https://github.com/reterVision/opengl-cube}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{OpenGL with Ruby!}
  s.files = Dir.glob('lib/**/*.rb') +
            Dir.glob('ext/**/*.{c,h,rb}')
  s.executables = ['opengl-cube']
  s.requirements << "opengl, v0.8.0.pre1"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

