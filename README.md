# ngx-niceindex
Customizable directory indexes for nginx without index modules

A directory indexer for [nginx](http://nginx.org/) built to be simple, lightweight and easy to customize. It doesn't require indexer modules. It relies on xslt and css to generate clean html. It borrows heavily from [nginx-indexer](https://github.com/nervo/nginx-indexer) and [ngx-superbindex](https://github.com/gibatronic/ngx-superbindex).

## Requirements

[nginx](http://nginx.org/) with the [xslt](http://nginx.org/en/docs/http/ngx_http_xslt_module.html) module (included by default on Ubuntu packages).

## Usage

1. Clone the repository into a hidden .niceindex folder in the directory you want to list:

    git clone https://github.com/reven/ngx-niceindex.git .niceindex

2. Add the following lines to the corresponding location in your `nginx.conf` file:
   ```nginx
   location / {
       autoindex on;
       autoindex_format xml;

       xslt_stylesheet /path/to/your/directory/.niceindex/niceindex.xslt;
   }
   ```

3. Restart nginx with `systemctl restart nginx` and *voilà*!
