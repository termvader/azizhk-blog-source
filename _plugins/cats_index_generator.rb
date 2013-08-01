module Jekyll
  class Cats_Index < Page
    def initialize(site, base, dir, pairs)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'cats_index.html')
      self.data['pairs'] = pairs

    end
  end


  class Cats_Generator < Generator

    safe true

    def generate(site)
      if site.layouts.key? 'cats_index'
        dir = site.config['category_dir'] || 'categories'
        cats = []
        catsdirname = []
        site.categories.keys.each do |category|

          #cats.push(category)
          cats.push(category.split(' ').map(&:capitalize).join(' '))
          catsdirname.push(category.downcase.strip.gsub(/ /, '-'))

        end
        pairs = cats.zip(catsdirname)
        pairs = pairs.sort_by(&:first)

        index = Cats_Index.new(site, site.source, dir, pairs)
        index.render(site.layouts, site.site_payload)
        index.write(site.dest)
        site.pages << index
      end
    end

  end

end