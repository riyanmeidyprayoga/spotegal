<?php

require "../koneksi.php";

$response = array();
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    # code...

    $data = $_POST['id_kt_tempat'];
    $sql = mysqli_query($connect, "SELECT * FROM tb_tempat, tb_tempat_kt
WHERE tb_tempat.id_kt_tempat = tb_tempat_kt.id_kt_tempat
AND tb_tempat_kt.id_kt_tempat = '$data' AND tb_tempat.deleted_at is NULL");

    while ($a = mysqli_fetch_array($sql)) {

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

        $b['nm_kt_tempat'] = $a['nm_kt_tempat'];
        $b['img_kt_tempat'] = $a['img_kt_tempat'];

        array_push($response, $b);
    }
}
echo json_encode($response);
