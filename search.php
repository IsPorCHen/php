<?php
header('Content-Type: text/html; charset=utf-8');

$db_server = "localhost";
$db_user = "root";
$db_pass = "";
$db_name = "users";

$connect = mysqli_connect($db_server, $db_user, $db_pass, $db_name);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $search_input = trim(strip_tags($_POST['book_name']));
    $search_terms = explode(' ', $search_input); // Разделяем введённый текст по пробелам

    // Создаём базовый SQL-запрос с параметрами
    $query = "SELECT * FROM book WHERE ";
    $conditions = [];
    $types = "";
    $params = [];

    foreach ($search_terms as $term) {
        $conditions[] = "(name LIKE ? OR genre LIKE ? OR author LIKE ? OR `publishing house` LIKE ? OR `date` LIKE ?)";
        $types .= "sssss";
        $like_term = "%" . $term . "%";
        array_push($params, $like_term, $like_term, $like_term, $like_term, $like_term);
    }

    $query .= implode(' OR ', $conditions);

    $stmt = $connect->prepare($query);
    $stmt->bind_param($types, ...$params);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        echo "<div class='results' style='display: flex; flex-wrap: wrap; gap: 15px; margin-top: 20px; overflow-y: auto; max-height: calc(60vh - 120px);'>";
        while ($book = $result->fetch_assoc()) {
            echo "<div class='book-info' style='background-color: #ffffff; border-radius: 8px; padding: 15px; margin: 10px 0; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); flex: 1 1 calc(33.333% - 30px); box-sizing: border-box;'>
                <b style='font-size: 20px;'>{$book['name']}</b>
                <p><strong>Автор:</strong> {$book['author']}</p>
                <p><strong>Жанр:</strong> {$book['genre']}</p>
                <p><strong>Дата:</strong> {$book['date']}</p>
                <p><strong>Издательство:</strong> {$book['publishing house']}</p>
            </div>";
        }
        echo "</div>";
    } else {
        echo "<p class='error'>Книги не найдены</p>";
    }
}
?>
