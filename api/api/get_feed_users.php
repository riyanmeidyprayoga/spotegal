<?php

require "../koneksi.php";

$response = array();
$idUsers = $_GET['idUsers'];
$sql = mysqli_query($connect, "SELECT * FROM feedbyTempat WHERE idMember='$idUsers'");

while ($a = mysqli_fetch_array($sql)) {
    $idFeed = $a['id'];

    $b['id'] = $a['id'];
    $b['idMember'] = $a['idMember'];
    $b['idSpot'] = $a['idSpot'];
    $b['createdDate'] = $a['createdDate'];
    $b['caption'] = $a['caption'];
    $b['photo'] = $a['photo'];
    $b['nm_spot'] = $a['nm_spot'];
    $b['namaLengkap'] = $a['namaLengkap'];
    $b['idUploaders'] = $a['idUploaders'];
    $b['photoUploaders'] = $a['photoUploaders'];
    $b['idTempat'] = $a['id_tempat'];

    $counting = mysqli_query($connect, "SELECT count(*) total FROM viewFeed WHERE idFeed='$idFeed'");
    $ab = mysqli_fetch_array($counting);
    $b['viewers'] = $ab['total'];


    array_push($response, $b);
}
echo json_encode($response);
