server {
    root /srv/www/doi.ionathan.ch;
    server_name doi.ionathan.ch;
    error_page 404 /index.html;
    location ~/.* {
        try_files $uri $uri/ =404;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/git.ionathan.ch/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/git.ionathan.ch/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    if ($host = doi.ionathan.ch) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

    server_name doi.ionathan.ch;
    listen 80;
    return 404; # managed by Certbot
}
