module Jekyll
  class Tags_Index < Page
    def initialize(site, base, dir, pairs)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tags_index.html')
      self.data['pairs'] = pairs

    end
  end


  class Tags_Generator < Generator

    safe true

    def generate(site)
      if site.layouts.key? 'tags_index'
        dir = site.config['tag_dir'] || 'tag'
        tags = []
        tagsdirname = []
        site.tags.keys.each do |tag|

          tag_dirname = tag.downcase
          tag_dirname = tag_dirname.gsub(/ /, '-')
          tags.push(tag)
          tagsdirname.push(tag_dirname)

        end
        pairs = tags.zip(tagsdirname)
        pairs = pairs.sort_by(&:first)

        index = Tags_Index.new(site, site.source, dir, pairs)
        index.render(site.layouts, site.site_payload)
        index.write(site.dest)
        site.pages << index
      end
    end

  end

end