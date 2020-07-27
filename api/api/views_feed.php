<?php

date_default_timezone_set('Asia/Jakarta');
$tglSekarang = date('Y-m-d H:i:s');
$tgl = date('Y-m-d');

require "../koneksi.php";

$response = array();
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    # code...

    $idUsers = $_POST['idUsers'];
    $idFeed = $_POST['idFeed'];

    $cekFeed = mysqli_query($connect, "SELECT * FROM viewFeed WHERE idFeed='$idFeed' and idMember='$idUsers' and createdDate between '$tgl' and '$tgl 23:59:59'");
    $cek = mysqli_fetch_array($cekFeed);
    if (isset($cek)) {
        # code...
        $insert =  "UPDATE viewFeed SET createdDate='$tglSekarang' WHERE idFeed='$idFeed' and idMember='$idUsers'";
        if (mysqli_query($connect, $insert)) {
            # code...
            $response['value'] = 1;
            echo json_encode($response);
        } else {
            # code...
            $response['value'] = 0;
            echo json_encode($response);
        }
    } else {
        # code...
        $insert =  "INSERT INTO viewFeed VALUE(NULL,'$idFeed','$idUsers','$tglSekarang')";
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
}
