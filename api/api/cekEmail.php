<?php

require "../koneksi.php";

$response = array();
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    # code...

    $email = $_POST['email'];
    $sql = mysqli_query($connect, "SELECT * FROM members WHERE email='$email'");
    $cek = mysqli_fetch_array($sql);
    if (isset($cek)) {
        # code...
        $response['value'] = 1;
        $response['email'] = $cek['email'];
        $response['namaLengkap'] = $cek['namaLengkap'];
        $response['photo'] = $cek['photo'];
        $response['phone'] = $cek['phone'];
        $response['id'] = $cek['id'];
        $response['createdDate'] = $cek['createdDate'];

        echo json_encode($response);
    } else {
        # code...
        $response['value'] = 0;
        echo json_encode($response);
    }
}
