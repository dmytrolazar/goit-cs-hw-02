# Вебсайти для перевірки
websites=("https://google.com" "https://github.com" "https://reddit.com" "https://chatgpt.com")

log_file="status.txt"

# Очистимо файл логів
> "$log_file"

# Перевіримо доступність сайтів
for website in "${websites[@]}"
do
    # Використаємо curl для надсилання HTTP-запиту і збереження статус-коду
    http_status=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")

    # Перевіримо статус-коду
    # 200 — сайт доступний
    if [ "$http_status" -eq 200 ]; then
        echo "$website is UP" >> "$log_file"
    # в іншому випадку не доступний
    else
        echo "$website is DOWN" >> "$log_file"
    fi
done

echo "Результати перевірки записані у файл $log_file"