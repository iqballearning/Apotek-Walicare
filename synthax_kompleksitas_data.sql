-- UNTUK MENAMPILKAN TABEL SUPPLIER
select*from supplier;

-- UNTUK MENAMPILKAN TABEL PRODUKOBAT
select*from produkobat;

-- UNTUK MENAMPILKAN TABEL PEMBELIAN
select*from pembelian;

-- UNTUK MENAMPILKAN TABEL DETAIL PEMBELIAN
select*from pembelian_detail;

-- UNTUK MENAMPILKAN TABEL PENJUALAN
select*from penjualan;

-- UNTUK MENAMPILKAN TABEL DETAIL PENJUALAN
select*from penjualan_detail;

-- UNTUK MELIHAT TANGGAL KADALUARSA OBAT
select*from produkobat
order by tanggal_kadaluarsa asc;

-- UNTUK MENAMPILKAN STOK TERENDAH
select*from produkobat
order by stok asc;

-- UNTUK MENGURUTKAN BELANJA (PEMBELIAN) TERTINGGI KE TERENDAH
select*from pembelian
order by total_pembelian desc;

-- UNTUK MENAMPILKAN STOK PRODUK YANG KURANG DARI 30
select*from produkobat
where stok < 30;

-- UNTUK MENAMPILKAN PRODUK OBAT YANG BERBENTUK STRIP
select*from produkobat
where satuan = 'strip';

-- UNTUK MENAMPILKAN PRODUK OBAT YANG BERBENTUK STRIP DAN KOTAK
select*from produkobat
where satuan in ('Strip', 'Kotak');

-- UNTUK MENAMPILKAN PRODUK OBAT YANG BERBENTUK STRIP
select*from produkobat
where satuan like '%strip%';

-- UNTUK MELIHAT PRODUK OBAT YANG MEMILIKI HARGA JUAL 10.000 - 30.000
select*from produkobat
where harga_jual between 7000 and 30000;

-- UNTUK MELIHAT PRODUK OBAT YANG MEMILIKI HARGA JUAL 10.000 - 30.000 DAN BERBENTUK STRIP
select*from produkobat
where harga_jual between 7000 and 30000 and satuan = 'strip';

-- UNTUK MELIHAT KEUNTUNGAN PER PRODUK OBAT
select kode_obat, nama_obat, harga_beli, harga_jual, harga_jual-harga_beli as 'Keuntungan' 
from produkobat;

-- UNTUK MENAMPILKAN HARGA PEMBELIAN PER PRODUK OBAT
select kode_obat, nama_obat, quantity_beli, harga_beli, quantity_beli*harga_beli as 'Total Pembelian Per Produk'
from pembelian_detail;

-- UNTUK MENAMPILKAN HARGA PENJUALAN PER PRODUK OBAT DI TANGGAL 2 APRIL 2023
select kode_obat, nama_obat, quantity_jual, harga_jual, quantity_jual*harga_jual as 'Total Penjualan Per Produk'
from penjualan_detail;

-- UNTUK MEMBATASI HASIL QUERY (30 orang)
select*from penjualan_detail
order by kode_penjualan limit 30;

-- UNTUK MENGGABUNGKAN TABEL SUPPLIER DAN PEMBELIAN
select*from pembelian
inner join supplier on (pembelian.kode_supplier = supplier.kode_supplier);

-- UNTUK MENGGABUNGKAN TABEL PEMBELIAN DAN PEMBELIAN DETAIL
select*from pembelian
inner join pembelian_detail on (pembelian.nomor_faktur = pembelian_detail.nomor_faktur);

-- UNTUK MENGGABUNGKAN TABEL PENJUALAN DAN PENJUALAN DETAIL
select*from penjualan
inner join penjualan_detail on (penjualan.kode_obat = penjualan_detail.kode_obat);

-- UNTUK MENAMPILKAN PEMBELIAN DETAIL DI SETIAP SUPPLIER BERDASARKAN NOMOR FAKTU
select*from pembelian
inner join pembelian_detail on (pembelian.nomor_faktur = pembelian_detail.nomor_faktur)
where nomor_faktur = 'FKTR111';

-- UNTUK MENGHITUNG PEMBELIAN DARI SUPPLIER
select sum(total_pembelian) as 'TOTAL BELANJA' from pembelian;

-- UNTUK MENGHITUNG JUMLAH TOTAL OBAT YANG DIBELI
select sum(quantity_beli) as 'JUMLAH TOTAL OBAT' from pembelian_detail;

-- UNTUK MENGHITUNG PEMBELIAN DARI SUPPLIER
select sum(quantity_beli*harga_beli) as 'TOTAL BELANJA PER SUPPLIER', nomor_faktur from pembelian_detail group by nomor_faktur;

-- UNTUK MENGHITUNG JUMLAH TOTAL OBAT YANG DIBELI
select sum(quantity_beli) as 'TOTAL QUANTITY PER SUPPLIER', nomor_faktur from pembelian_detail group by nomor_faktur;

-- UNTUK MENGHITUNG TOTAL PENJUALAN
select sum(total_penjualan) as 'TOTAL PENJUALAN' from penjualan;

-- UNTUK MENGHITUNG TOTAL PENJUALAN
select sum(quantity_jual*harga_jual) as 'PENJUALAN SEHARI (2 APRIL)' from penjualan_detail; 