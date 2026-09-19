#!/bin/sh
# Собирает page.html (для публикации) и preview/index.html (для локального просмотра).
cd "$(dirname "$0")" || exit 1
mkdir -p preview
{
  echo '<title>Вечерний сеанс</title>'
  echo '<link rel="preconnect" href="https://fonts.googleapis.com">'
  echo '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>'
  echo '<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500&family=Onest:wght@400;500;600&family=Unbounded:wght@500;700&display=swap">'
  echo '<style>'; cat style.css; echo '</style>'
  cat body.html
  echo '<script>'; cat data.js; echo '</script>'
  echo '<script>'; cat app.js; echo '</script>'
} > page.html
{
  echo '<!doctype html><html lang="ru"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><style>body{margin:0}[hidden]{display:none!important}</style></head><body>'
  cat page.html
  echo '</body></html>'
} > preview/index.html
wc -c page.html
