<?php

require "../koneksi.php";

$response = array();
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    # code...

    $email = $_POST['email'];
    $namaLengkap = $_POST['namaLengkap'];
    $photoUrl = $_POST['photoUrl'];
    $phone = $_POST['phone'];

    $cekUsers = mysqli_query($connect, "SELECT * FROM members order by id desc limit 1");
    $ab = mysqli_fetch_array($cekUsers);
    $idUsers = $ab['id'] + 1;

    $insert = "INSERT INTO members VALUE('$idUsers','$email',NOW(),'$namaLengkap','$photoUrl','$phone')";
    if (mysqli_query($connect, $insert)) {
        # code...
        $response['value'] = 1;
        $response['email'] = "$email";
        $response['namaLengkap'] = "$namaLengkap";
        $response['photo'] = "$photoUrl";
        $response['phone'] = "$phone";
        $response['id'] = "$idUsers";
        $response['createdDate'] = date("Y-m-d H:i:s");
        $response['message'] = "Berhasil";
        
        echo json_encode($response);
    } else {
        # code...
        $response['value'] = 0;
        $response['message'] = "Silahkan hubungi administrator";
        echo json_encode($response);
    }
}
