<?php

date_default_timezone_set('Asia/Jakarta');
$tglSekarang = date('Y-m-d H:i:s');
$tgl = date('Y-m-d');

require "../koneksi.php";

$response = array();
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    # code...

    $idUsers = $_POST['idUsers'];
    $idSpot = $_POST['idSpot'];
    $caption = $_POST['caption'];


    $image = date('dmYHis') . str_replace(" ", "", basename($_FILES["image"]["name"]));
    $imagePath = "../images/feed/" . $image;

    move_uploaded_file($_FILES['image']['tmp_name'], $imagePath);

    $insert =  "INSERT INTO feed VALUE(NULL,'$idUsers','$idSpot','$tglSekarang','$image','$caption')";
    if (mysqli_query($connect, $insert)) {
        # code...
        $response['value'] = 1;
        echo json_encode($response);
    } else {
        # code...
        $response['value'] = 0;
        echo json_encode($response);
    }
}
