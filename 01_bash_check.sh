#!/bin/bash

# Список вебсайтів
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів
logfile="website_status.log"

# Очищаємо файл логів перед записом нових даних
> "$logfile"

check_site() {
    # Перевірка доступності
    if curl -s -L -I "$1" | grep "HTTP.* 200" > /dev/null; then
        # Запис результатів у файл
        echo "$1 is UP" >> "$logfile"
    else
        # Запис результатів у файл
        echo "$1 is DOWN" >> "$logfile"
    fi
}

echo "Початок перевірки сайтів"
for site in "${websites[@]}"; do
    check_site "$site"
done
echo "Перевірка сайтів завершена, результати перевірки у файлі $logfile"
