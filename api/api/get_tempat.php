<?php

require "../koneksi.php";

$response = array();
$sql = mysqli_query($connect, "SELECT * FROM tb_tempat 
    WHERE deleted_at IS NULL");

while ($a = mysqli_fetch_array($sql)) {
    # code...

    $b['id_tempat'] = $a['id_tempat'];
    $b['nm_tempat'] = $a['nm_tempat'];
    $b['id_tempat_kt'] = $a['id_kt_tempat'];
    $b['tkt_tempat'] = $a['tkt_tempat'];
    $b['lok_tempat'] = $a['lok_tempat'];
    $b['des_tempat'] = $a['des_tempat'];
    $b['img_tempat'] = $a['img_tempat'];
    $b['lat_tempat'] = $a['lat_tempat'];
    $b['long_tempat'] = $a['long_tempat'];
    $b['tgl_ad_tempat'] = $a['created_at'];
    $b['tgl_up_tempat'] = $a['updated_at'];


    array_push($response, $b);
}
echo json_encode($response);
?>