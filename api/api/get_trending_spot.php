<?php

require "../koneksi.php";


date_default_timezone_set('Asia/Jakarta');
$tglSekarang = date('Y-m-d H:i:s');
$tgl = date('Y-m-d');

$response = array();

$cekTrending = mysqli_query($connect, "SELECT * FROM trending");
$gh = mysqli_fetch_array($cekTrending);
$trendingCounting = $gh['trendingCounting'];

$sql = mysqli_query($connect, "SELECT COUNT(*) viewers, (SELECT CounT(*) FROM feed WHERE idSpot = b.idSpot and createdDate between '$tgl' and '$tgl 23:59:59') upload , 
b.idSpot, c.nm_spot, c.img_spot, d.nm_tempat, c.tkt_spot, c.des_spot  FROM viewFeed a 
LEFT JOIN feed b on a.idFeed = b.id 
left join tb_spot c on b.idSpot = c.id_spot
LEFT JOIN tb_tempat d on d.id_tempat = c.id_tempat 
WHERE a.createdDate between '$tgl' and '$tgl 23:59:59' group by b.idSpot order by viewers desc, upload desc limit $trendingCounting");
$no = 1;
while ($a = mysqli_fetch_array($sql)) {
    $b['trending'] = "Trending $no";
    $b['viewers'] = $a['viewers'];
    $b['upload'] = $a['upload'];
    $b['totalCounting'] = (string) ((int) $a['upload'] + (int) $a['viewers']);
    $b['idSpot'] = $a['idSpot'];
    $b['photo'] = $a['img_spot'];
    $b['nmSpot'] = $a['nm_spot'];
    $b['nmTempat'] = $a['nm_tempat'];
    $b['harga'] = $a['tkt_spot'];
    $b['desc_spot'] = $a['des_spot'];

    array_push($response, $b);
    $no++;
}



echo json_encode($response);
