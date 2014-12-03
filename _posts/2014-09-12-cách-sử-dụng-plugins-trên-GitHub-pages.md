---
layout: post
title: Cách sử dụng plugins trên GitHub pages
description: Cách sử dụng plugins trên GitHub pages
comments: true
share: true
tag: [Jekyll]
---

GitHub pages chạy Jekyll ở chế độ an toàn (safe mode) nên các plugins, chẳng hạn plugins hay ho [này](https://github.com/ggreer/jekyll-gallery-generator) sẽ không chạy trực tiếp được trên GitHub pages.

Vậy giải pháp là gì?

- **Bước 1:** Tạo một thư mục git dùng để chạy website ở chế độ có plugins và đẩy lên một thư mục trên GitHub ở nhánh `master`.

- **Bước 2:** Trong thư mục git này, tạo một file Rakefile với nội dung như sau:

{% highlight ruby %}
 require 'rubygems'
    require 'rake'
    require 'rdoc'
    require 'date'
    require 'yaml'
    require 'tmpdir'
    require 'jekyll'

    desc "Generate blog files"
    task :generate do
      Jekyll::Site.new(Jekyll.configuration({
        "source"      => ".",
        "destination" => "_site"
      })).process
    end


    desc "Generate and publish blog to gh-pages"
    task :publish => [:generate] do
      Dir.mktmpdir do |tmp|
        system "mv _site/* #{tmp}"
        system "git checkout -B gh-pages"
        system "rm -rf *"
        system "mv #{tmp}/* ."
        message = "Site updated at #{Time.now.utc}"
        system "git add ."
        system "git commit -am #{message.shellescape}"
        system "git push origin gh-pages --force"
        system "git checkout master"
        system "echo yolo"
      end
    end

task :default => :publish
{% endhighlight %}

Rakefile này chạy Jekyll, di chuyển các file trong thư mục *_site* vào nhánh `gh-pages` và đẩy lên GitHub.

- **Bước 3:** Trong _config.yml thêm vào đoạn sau để tránh trùng lắp:

{% highlight yaml %}
exclude: ['Gemfile', 'Gemfile.lock', 'Rakefile', 'README.md']
{% endhighlight %}

- **Bước 4:** Từ giờ trở đi, mỗi khi chỉnh sửa trang web, sau khi `git commit` và `git push`, bạn chỉ cần chạy thêm `rake` để cập nhật.
