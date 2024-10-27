-- Tạo bảng Chuyên gia
CREATE TABLE ChuyenGia (
    MaChuyenGia INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
    ChuyenNganh NVARCHAR(50),
    NamKinhNghiem INT
);

-- Tạo bảng Công ty
CREATE TABLE CongTy (
    MaCongTy INT PRIMARY KEY,
    TenCongTy NVARCHAR(100),
    DiaChi NVARCHAR(200),
    LinhVuc NVARCHAR(50),
    SoNhanVien INT
);

-- Tạo bảng Dự án
CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(200),
    MaCongTy INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);

-- Tạo bảng Kỹ năng
CREATE TABLE KyNang (
    MaKyNang INT PRIMARY KEY,
    TenKyNang NVARCHAR(100),
    LoaiKyNang NVARCHAR(50)
);

-- Tạo bảng Chuyên gia - Kỹ năng
CREATE TABLE ChuyenGia_KyNang (
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    PRIMARY KEY (MaChuyenGia, MaKyNang),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaKyNang) REFERENCES KyNang(MaKyNang)
);

-- Tạo bảng Chuyên gia - Dự án
CREATE TABLE ChuyenGia_DuAn (
    MaChuyenGia INT,
    MaDuAn INT,
    VaiTro NVARCHAR(50),
    NgayThamGia DATE,
    PRIMARY KEY (MaChuyenGia, MaDuAn),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(1, N'Nguyễn Văn An', '1985-05-10', N'Nam', 'nguyenvanan@email.com', '0901234567', N'Phát triển phần mềm', 10),
(2, N'Trần Thị Bình', '1990-08-15', N'Nữ', 'tranthiminh@email.com', '0912345678', N'An ninh mạng', 7),
(3, N'Lê Hoàng Cường', '1988-03-20', N'Nam', 'lehoangcuong@email.com', '0923456789', N'Trí tuệ nhân tạo', 9),
(4, N'Phạm Thị Dung', '1992-11-25', N'Nữ', 'phamthidung@email.com', '0934567890', N'Khoa học dữ liệu', 6),
(5, N'Hoàng Văn Em', '1987-07-30', N'Nam', 'hoangvanem@email.com', '0945678901', N'Điện toán đám mây', 8),
(6, N'Ngô Thị Phượng', '1993-02-14', N'Nữ', 'ngothiphuong@email.com', '0956789012', N'Phân tích dữ liệu', 5),
(7, N'Đặng Văn Giang', '1986-09-05', N'Nam', 'dangvangiang@email.com', '0967890123', N'IoT', 11),
(8, N'Vũ Thị Hương', '1991-12-20', N'Nữ', 'vuthihuong@email.com', '0978901234', N'UX/UI Design', 7),
(9, N'Bùi Văn Inh', '1989-04-15', N'Nam', 'buivaninch@email.com', '0989012345', N'DevOps', 8),
(10, N'Lý Thị Khánh', '1994-06-30', N'Nữ', 'lythikhanh@email.com', '0990123456', N'Blockchain', 4);

-- Chèn dữ liệu mẫu vào bảng Công ty
INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(1, N'TechViet Solutions', N'123 Đường Lê Lợi, TP.HCM', N'Phát triển phần mềm', 200),
(2, N'DataSmart Analytics', N'456 Đường Nguyễn Huệ, Hà Nội', N'Phân tích dữ liệu', 150),
(3, N'CloudNine Systems', N'789 Đường Trần Hưng Đạo, Đà Nẵng', N'Điện toán đám mây', 100),
(4, N'SecureNet Vietnam', N'101 Đường Võ Văn Tần, TP.HCM', N'An ninh mạng', 80),
(5, N'AI Innovate', N'202 Đường Lý Tự Trọng, Hà Nội', N'Trí tuệ nhân tạo', 120);

-- Chèn dữ liệu mẫu vào bảng Dự án
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(1, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Hoàn thành'),
(2, N'Xây dựng hệ thống phân tích dữ liệu khách hàng', 2, '2023-03-15', '2023-09-15', N'Đang thực hiện'),
(3, N'Triển khai giải pháp đám mây cho doanh nghiệp', 3, '2023-02-01', '2023-08-31', N'Đang thực hiện'),
(4, N'Nâng cấp hệ thống bảo mật cho tập đoàn viễn thông', 4, '2023-04-01', '2023-10-31', N'Đang thực hiện'),
(5, N'Phát triển chatbot AI cho dịch vụ khách hàng', 5, '2023-05-01', '2023-11-30', N'Đang thực hiện');

-- Chèn dữ liệu mẫu vào bảng Kỹ năng
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(1, 'Java', N'Ngôn ngữ lập trình'),
(2, 'Python', N'Ngôn ngữ lập trình'),
(3, 'Machine Learning', N'Công nghệ'),
(4, 'AWS', N'Nền tảng đám mây'),
(5, 'Docker', N'Công cụ'),
(6, 'Kubernetes', N'Công cụ'),
(7, 'SQL', N'Cơ sở dữ liệu'),
(8, 'NoSQL', N'Cơ sở dữ liệu'),
(9, 'React', N'Framework'),
(10, 'Angular', N'Framework');

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Kỹ năng
INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
VALUES 
(1, 1, 5), (1, 7, 4), (1, 9, 3),
(2, 2, 4), (2, 3, 3), (2, 8, 4),
(3, 2, 5), (3, 3, 5), (3, 4, 3),
(4, 2, 4), (4, 7, 5), (4, 8, 4),
(5, 4, 5), (5, 5, 4), (5, 6, 4),
(6, 2, 4), (6, 3, 3), (6, 7, 5),
(7, 1, 3), (7, 2, 4), (7, 5, 3),
(8, 9, 5), (8, 10, 4),
(9, 5, 5), (9, 6, 5), (9, 4, 4),
(10, 2, 3), (10, 3, 3), (10, 8, 4);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Dự án
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 1, N'Trưởng nhóm phát triển', '2023-01-01'),
(2, 4, N'Chuyên gia bảo mật', '2023-04-01'),
(3, 5, N'Kỹ sư AI', '2023-05-01'),
(4, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(5, 3, N'Kiến trúc sư đám mây', '2023-02-01'),
(6, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(7, 3, N'Kỹ sư IoT', '2023-02-01'),
(8, 1, N'Nhà thiết kế UX/UI', '2023-01-01'),
(9, 3, N'Kỹ sư DevOps', '2023-02-01'),
(10, 5, N'Kỹ sư Blockchain', '2023-05-01');


-- 8. Hiển thị tên và cấp độ của tất cả các kỹ năng của chuyên gia có MaChuyenGia là 1.
select k.TenKyNang,cgkn.CapDo
from ChuyenGia_KyNang cgkn
join KyNang k on k.MaKyNang=cgkn.MaKyNang
where MaChuyenGia=1;


-- 9. Liệt kê tên các chuyên gia tham gia dự án có MaDuAn là 2.
select c.HoTen
from ChuyenGia_DuAn cgda
join ChuyenGia c on c.MaChuyenGia=cgda.MaChuyenGia
where MaDuAn=2;


-- 10. Hiển thị tên công ty và tên dự án của tất cả các dự án.
select ct.TenCongTy,da.TenDuAn
from DuAn da
join Congty ct on ct.MaCongTy=da.MaCongTy;


-- 11. Đếm số lượng chuyên gia trong mỗi chuyên ngành.
select ChuyenNganh,count(MaChuyenGia) as soluongchuyengia
from ChuyenGia
group by ChuyenNganh;



-- 12. Tìm chuyên gia có số năm kinh nghiệm cao nhất.
select *from ChuyenGia
where NamKinhNghiem=(select max(namkinhnghiem) from ChuyenGia);

-- 13. Liệt kê tên các chuyên gia và số lượng dự án họ tham gia.
select cg.HoTen,count(MaDuAn) as soluongduan
from ChuyenGia cg
join ChuyenGia_DuAn cgda on cg.MaChuyenGia=cgda.MaChuyenGia
group by cg.HoTen;


-- 14. Hiển thị tên công ty và số lượng dự án của mỗi công ty.
select ct.TenCongTy,count(da.Maduan) as soluongduan
from CongTy ct
left join DuAn da on ct.MaCongTy=da.MaCongTy
group by ct.TenCongTy;


-- 15. Tìm kỹ năng được sở hữu bởi nhiều chuyên gia nhất.
SELECT TOP 1 k.TenKyNang, COUNT(DISTINCT cgkn.MaChuyenGia) AS SoLuongChuyenGia
FROM KyNang k
JOIN ChuyenGia_KyNang cgkn ON k.MaKyNang = cgkn.MaKyNang
GROUP BY k.TenKyNang
ORDER BY SoLuongChuyenGia DESC;



-- 16. Liệt kê tên các chuyên gia có kỹ năng 'Python' với cấp độ từ 4 trở lên.
SELECT cg.HoTen
FROM ChuyenGia cg
JOIN ChuyenGia_KyNang cgkn ON cg.MaChuyenGia = cgkn.MaChuyenGia
JOIN KyNang k ON cgkn.MaKyNang = k.MaKyNang
WHERE k.TenKyNang = 'Python' AND cgkn.CapDo >= 4;



-- 17. Tìm dự án có nhiều chuyên gia tham gia nhất.
SELECT TOP 1 da.TenDuAn, COUNT(cgda.MaChuyenGia) AS SoLuongChuyenGia
FROM DuAn da
JOIN ChuyenGia_DuAn cgda ON da.MaDuAn = cgda.MaDuAn
GROUP BY da.TenDuAn
ORDER BY SoLuongChuyenGia DESC;


-- 18. Hiển thị tên và số lượng kỹ năng của mỗi chuyên gia.
SELECT cg.HoTen, COUNT(cgkn.MaKyNang) AS SoLuongKyNang
FROM ChuyenGia cg
LEFT JOIN ChuyenGia_KyNang cgkn ON cg.MaChuyenGia = cgkn.MaChuyenGia
GROUP BY cg.HoTen;


-- 19. Tìm các cặp chuyên gia làm việc cùng dự án.
SELECT cg.HoTen, COUNT(cgkn.MaKyNang) AS SoLuongKyNang
FROM ChuyenGia cg
LEFT JOIN ChuyenGia_KyNang cgkn ON cg.MaChuyenGia = cgkn.MaChuyenGia
GROUP BY cg.HoTen;




-- 20. Liệt kê tên các chuyên gia và số lượng kỹ năng cấp độ 5 của họ.
SELECT cg.HoTen, COUNT(cgkn.MaKyNang) AS SoLuongKyNangCapDo5
FROM ChuyenGia cg
JOIN ChuyenGia_KyNang cgkn ON cg.MaChuyenGia = cgkn.MaChuyenGia
WHERE cgkn.CapDo = 5
GROUP BY cg.HoTen;


-- 21. Tìm các công ty không có dự án nào.
SELECT ct.TenCongTy
FROM CongTy ct
LEFT JOIN DuAn da ON ct.MaCongTy = da.MaCongTy
WHERE da.MaDuAn IS NULL;



-- 22. Hiển thị tên chuyên gia và tên dự án họ tham gia, bao gồm cả chuyên gia không tham gia dự án nào.
SELECT cg.HoTen, da.TenDuAn
FROM ChuyenGia cg
LEFT JOIN ChuyenGia_DuAn cgda ON cg.MaChuyenGia = cgda.MaChuyenGia
LEFT JOIN DuAn da ON cgda.MaDuAn = da.MaDuAn;



-- 23. Tìm các chuyên gia có ít nhất 3 kỹ năng.
SELECT cg.HoTen
FROM ChuyenGia cg
JOIN ChuyenGia_KyNang cgkn ON cg.MaChuyenGia = cgkn.MaChuyenGia
GROUP BY cg.HoTen
HAVING COUNT(cgkn.MaKyNang) >= 3;



-- 24. Hiển thị tên công ty và tổng số năm kinh nghiệm của tất cả chuyên gia trong các dự án của công ty đó.
SELECT ct.TenCongTy, SUM(cg.NamKinhNghiem) AS TongNamKinhNghiem
FROM CongTy ct
JOIN DuAn da ON ct.MaCongTy = da.MaCongTy
JOIN ChuyenGia_DuAn cgda ON da.MaDuAn = cgda.MaDuAn
JOIN ChuyenGia cg ON cgda.MaChuyenGia = cg.MaChuyenGia
GROUP BY ct.TenCongTy;



-- 25. Tìm các chuyên gia có kỹ năng 'Java' nhưng không có kỹ năng 'Python'.
SELECT cg.HoTen
FROM ChuyenGia cg
JOIN ChuyenGia_KyNang cgkn1 ON cg.MaChuyenGia = cgkn1.MaChuyenGia
JOIN KyNang k1 ON cgkn1.MaKyNang = k1.MaKyNang AND k1.TenKyNang = 'Java'
LEFT JOIN ChuyenGia_KyNang cgkn2 ON cg.MaChuyenGia = cgkn2.MaChuyenGia
JOIN KyNang k2 ON cgkn2.MaKyNang = k2.MaKyNang AND k2.TenKyNang = 'Python'
WHERE cgkn2.MaKyNang IS NULL;


-- 76. Tìm chuyên gia có số lượng kỹ năng nhiều nhất.
SELECT TOP 1 cg.HoTen, COUNT(cgkn.MaKyNang) AS SoLuongKyNang
FROM ChuyenGia cg
JOIN ChuyenGia_KyNang cgkn ON cg.MaChuyenGia = cgkn.MaChuyenGia
GROUP BY cg.HoTen
ORDER BY SoLuongKyNang DESC;



-- 77. Liệt kê các cặp chuyên gia có cùng chuyên ngành.
SELECT cg1.HoTen AS ChuyenGia1, cg2.HoTen AS ChuyenGia2, cg.ChuyenNganh
FROM ChuyenGia cg
JOIN ChuyenGia cg1 ON cg.ChuyenNganh = cg1.ChuyenNganh AND cg.MaChuyenGia <> cg1.MaChuyenGia
JOIN ChuyenGia cg2 ON cg.ChuyenNganh = cg2.ChuyenNganh AND cg.MaChuyenGia <> cg2.MaChuyenGia
GROUP BY cg1.HoTen, cg2.HoTen, cg.ChuyenNganh;


-- 78. Tìm công ty có tổng số năm kinh nghiệm của các chuyên gia trong dự án cao nhất.
SELECT TOP 1 ct.TenCongTy, SUM(cg.NamKinhNghiem) AS TongNamKinhNghiem
FROM CongTy ct
JOIN DuAn da ON ct.MaCongTy = da.MaCongTy
JOIN ChuyenGia_DuAn cgda ON da.MaDuAn = cgda.MaDuAn
JOIN ChuyenGia cg ON cgda.MaChuyenGia = cg.MaChuyenGia
GROUP BY ct.TenCongTy
ORDER BY TongNamKinhNghiem DESC;




-- 79. Tìm kỹ năng được sở hữu bởi tất cả các chuyên gia.
SELECT k.TenKyNang
FROM KyNang k
WHERE NOT EXISTS (
    SELECT *
    FROM ChuyenGia cg
    WHERE NOT EXISTS (
        SELECT *
        FROM ChuyenGia_KyNang cgkn
        WHERE cgkn.MaKyNang = k.MaKyNang AND cgkn.MaChuyenGia = cg.MaChuyenGia
    )
);



