#!/bin/sh
# Собирает три варианта страницы из исходников:
#   page.html          — фрагмент для публикации в Claude (Artifact)
#   index.html         — самостоятельная страница (GitHub Pages)
#   preview/index.html — копия для локального просмотра
cd "$(dirname "$0")" || exit 1
mkdir -p preview
FONTS='https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500&family=Onest:wght@400;500;600&family=Unbounded:wght@500;700&display=swap'
{
  echo '<title>Вечерний сеанс</title>'
  echo '<link rel="preconnect" href="https://fonts.googleapis.com">'
  echo '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>'
  echo "<link rel=\"stylesheet\" href=\"$FONTS\">"
  echo '<style>'; cat style.css; echo '</style>'
  cat body.html
  echo '<script>'; cat data.js; echo '</script>'
  echo '<script>'; cat app.js; echo '</script>'
} > page.html
{
  echo '<!doctype html><html lang="ru"><head><meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">'
  echo '<meta name="description" content="Личный гид по фильмам и сериалам 2021–2026">'
  echo '<title>Вечерний сеанс</title>'
  echo '<link rel="preconnect" href="https://fonts.googleapis.com">'
  echo '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>'
  echo "<link rel=\"stylesheet\" href=\"$FONTS\">"
  echo '<style>body{margin:0}[hidden]{display:none!important}</style>'
  echo '<style>'; cat style.css; echo '</style>'
  echo '</head><body>'
  cat body.html
  echo '<script>'; cat data.js; echo '</script>'
  echo '<script>'; cat app.js; echo '</script>'
  echo '</body></html>'
} > index.html
cp index.html preview/index.html
wc -c page.html index.html
