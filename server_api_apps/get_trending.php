<?php

require "./koneksi.php";

$response = array();
$sql = mysqli_query($connect, "SELECT * FROM tb_spot, tb_tempat WHERE tb_spot.id_tempat = tb_tempat.id_tempat AND tb_spot.deleted_at IS NULL AND tren_spot = 1");

while ($a = mysqli_fetch_array($sql)) {

    $b['id_spot'] = $a['id_spot'];
    $b['nm_spot'] = $a['nm_spot'];
    $b['id_tempat_spot'] = $a['id_tempat'];
    $b['nm_tempat_spot'] = $a['nm_tempat'];
    $b['tkt_spot'] = $a['tkt_spot'];
    $b['tren_spot'] = $a['tren_spot'];
    $b['des_spot'] = $a['des_spot'];
    $b['img_spot'] = $a['img_spot'];
    $b['tgl_ad_spot'] = $a['created_at'];
    $b['tgl_up_spot'] = $a['updated_at'];

    array_push($response, $b);
}
echo json_encode($response);
?>