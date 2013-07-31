module Jekyll
  class Tags_Tag_Index < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tags_tag_index.html')
      self.data['tag'] = tag
    end
  end
  class Tags_Tag_Generator < Generator
    safe true
    def generate(site)
      if site.layouts.key? 'tags_tag_index'
        dir = site.config['tag_dir'] || 'tag'
        site.tags.keys.each do |tag|
          tag_dirname = tag.downcase;
          tag_dirname = tag_dirname.gsub(/ /, '-')
          write_tag_index(site, File.join(dir, tag_dirname), tag)
        end
      end
    end
    def write_tag_index(site, dir, tag)
      index = Tags_Tag_Index.new(site, site.source, dir, tag)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end
end