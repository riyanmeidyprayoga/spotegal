
<?php

require "./koneksi.php";

$response = array();
$sql = mysqli_query($connect, "SELECT * FROM tb_tempat_kt 
	WHERE deleted_at IS NULL");

while ($a = mysqli_fetch_array($sql)) {

    $b['id_kt_tempat'] = $a['id_kt_tempat'];
    $b['nm_kt_tempat'] = $a['nm_kt_tempat'];
    $b['img_kt_tempat'] = $a['img_kt_tempat'];
    $b['tgl_ad_kt_tempat'] = $a['created_at'];
    $b['tgl_up_kt_tempat'] = $a['updated_at'];

    array_push($response, $b);
}
echo json_encode($response);

?>