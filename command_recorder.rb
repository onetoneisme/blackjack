require 'pp'

BASE_DIR = File.join(File.dirname(__FILE__),'units_refactored')
TAG = '```sh'
CF_DOMAIN = "54.164.224.55.xip.io"

class CommandRecorder

  attr_accessor :dir

  def initialize(directory, cf_domain)
    @dir = File.join(BASE_DIR, directory)
    @cf_domain = cf_domain
  end

  def process
    file_list.each_pair do |k,v|
      File.open(File.join(k,'steps.sh'), 'w') do |f|

        f << record_header(k)

        v.each do |file|
          content = File.read(File.join(k, file)).split("\n")
          if file.split(".").last == "md"
            content.each_with_index do |line, index|
              if line.include?(TAG)
                f << "#{content[index + 1].gsub("{{echo $CF_DOMAIN}}","$CF_DOMAIN")}\n"
              end
            end
          else
            content.each do |line|
              f << line if line.include?('check')
            end
          end
        end
      end
    end
  end

  private

  def record_header(unit)
    <<EOF
#!/bin/bash -e

CF_DOMAIN=#{CF_DOMAIN}

echo Running commands for unit: #{unit.split('/').last}

EOF
  end

  def file_list
    files = {}
    Dir[File.join(@dir,'/**/*.{md,verify.sh}')].each do |file|
      base_dir, filename = file_details(file)
      files.merge!({base_dir => []}) unless files.has_key?(base_dir)
      files[base_dir] << filename
    end
    files.each_pair { |k,v| v.sort! }
  end

  def file_details(file)
    base_dir = File.dirname(file)
    return base_dir, File.basename(file)
  end

end

cmdr = CommandRecorder.new('Cf for operators (basic)', CF_DOMAIN)
pp cmdr.process