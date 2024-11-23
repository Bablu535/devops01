function getRecommendations() {
    const ram = parseInt(document.getElementById("ram").value, 10);
    const rom = parseInt(document.getElementById("rom").value, 10);
    const graphics = document.getElementById("graphics").value.toLowerCase();
    const camera = parseInt(document.getElementById("camera").value, 10);

    const recommendations = document.getElementById("recommendations");
    recommendations.innerHTML = ""; // Clear previous results

    let phones = [];

    // Dummy data for phone recommendations
    const phoneList = [
        { name: "Samsung Galaxy S21 Ultra", ram: 12, rom: 512, graphics: "high", camera: 108 },
        { name: "iPhone 14 Pro Max", ram: 6, rom: 512, graphics: "high", camera: 48 },
        { name: "Google Pixel 7 Pro", ram: 12, rom: 256, graphics: "high", camera: 50 },
        { name: "OnePlus 11", ram: 16, rom: 256, graphics: "high", camera: 50 },
        { name: "Xiaomi Mi 11 Ultra", ram: 12, rom: 256, graphics: "high", camera: 50 },
        { name: "Oppo Find X5 Pro", ram: 12, rom: 512, graphics: "high", camera: 50 },
        { name: "Sony Xperia 1 IV", ram: 12, rom: 512, graphics: "high", camera: 12 },
        { name: "Samsung Galaxy A52", ram: 6, rom: 128, graphics: "intermediate", camera: 64 },
        { name: "iPhone 13", ram: 4, rom: 128, graphics: "intermediate", camera: 12 },
        { name: "Realme GT 2 Pro", ram: 8, rom: 256, graphics: "high", camera: 50 },
        { name: "Asus ROG Phone 6", ram: 16, rom: 512, graphics: "high", camera: 50 },
        { name: "Vivo X80 Pro", ram: 12, rom: 256, graphics: "high", camera: 50 },
        { name: "Motorola Edge 30 Ultra", ram: 12, rom: 256, graphics: "high", camera: 200 },
        { name: "Xiaomi Redmi Note 12 Pro", ram: 8, rom: 128, graphics: "intermediate", camera: 108 },
        { name: "Poco F4 GT", ram: 12, rom: 256, graphics: "high", camera: 64 },
        { name: "Samsung Galaxy Z Fold 4", ram: 12, rom: 512, graphics: "high", camera: 50 },
        { name: "OnePlus Nord 2T", ram: 8, rom: 128, graphics: "intermediate", camera: 50 },
        { name: "Realme Narzo 50 Pro", ram: 6, rom: 128, graphics: "intermediate", camera: 48 },
        { name: "Sony Xperia 5 IV", ram: 8, rom: 128, graphics: "high", camera: 12 },
        { name: "Huawei Mate 50 Pro", ram: 8, rom: 512, graphics: "high", camera: 50 }
    ];

    // Filter the phones based on user input
    phones = phoneList.filter(phone => {
        return (
            phone.ram >= ram &&
            phone.rom >= rom &&
            phone.graphics.toLowerCase() === graphics &&
            phone.camera >= camera
        );
    });

    // Display the filtered phones
    if (phones.length > 0) {
        phones.forEach(phone => {
            const div = document.createElement("div");
            div.classList.add("recommendation-item");
            div.textContent = `Model: ${phone.name}, RAM: ${phone.ram}GB, ROM: ${phone.rom}GB, Camera: ${phone.camera}MP, Graphics: ${phone.graphics}`;
            recommendations.appendChild(div);
        });
    } else {
        recommendations.textContent = "No phones match your criteria.";
    }
}
